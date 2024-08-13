import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';
import 'package:mentora_admin/utils/NetworkMonitor.dart';

class LeadsController extends GetxController {
  final RxString id = ''.obs;
  final RxString nomeFantasia = ''.obs;
  final RxString nomeContato = ''.obs;
  final RxString celularContato = ''.obs;
  final RxString emailContato = ''.obs;
  final RxString observacao = ''.obs;
  final RxString sistema = ''.obs;
  final RxString valor = ''.obs;
  final RxInt satisfeito = 1.obs;
  final RxString escritorio = ''.obs;
  final RxBool disparaMensagem = false.obs;
  final Rx<DateTime> dataCriacao = DateTime.now().obs;

  final MaskedTextController celularMask =
      MaskedTextController(mask: '(00) 00000-0000');

  var leadsList = <Map<String, dynamic>>[].obs;
  final Box _box = Hive.box('offlineData');
  var pendingData = <Map<String, dynamic>>[].obs;
  final AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    fetchLeads();
    loadPendingData();
  }

  @override
  void onResumed() {
    loadPendingData();
  }

  @override
  void onReady() {
    super.onReady();
    ever(leadsList, (_) => fetchLeads());
    ever(pendingData, (_) => loadPendingData());
  }

  void loadPendingData() {
    List<Map<String, dynamic>> data =
        _box.values.toList().cast<Map<String, dynamic>>();
    pendingData.assignAll(data);
  }

  void fetchLeads() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('leads')
            .where('userId', isEqualTo: user.uid)
            .get();
        leadsList.value = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        Get.snackbar(
          'Alerta',
          'Usuário não autenticado',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 2000),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Alerta',
        'Erro ao buscar leads: $e',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 2000),
      );
    }
  }

  void saveLead() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      authController.login(authController.usernameController.value.text,
          authController.passwordController.value.text);
    }
    if (nomeFantasia.isEmpty || nomeContato.isEmpty || celularContato.isEmpty) {
      Get.snackbar(
        'Alerta',
        'Por favor, preencha todos os campos',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 2000),
      );
      return;
    } else {
      if (disparaMensagem.value) {}
      User? user = FirebaseAuth.instance.currentUser;
      try {
        sendData({
          'nomeFantasia': nomeFantasia.value,
          'userId': user?.uid,
          'nomeContato': nomeContato.value,
          'celularContato': removeNonNumeric(celularContato.value),
          'emailContato': emailContato.value,
          'observacao': observacao.value,
          'disparaMensagem': disparaMensagem.value,
          'sistema': sistema.value,
          'valor': valor.value,
          'satisfeito': satisfeito.value,
          'escritorio': escritorio.value,
          'dataCriacao': DateFormat('dd/MM/yyyy').format(dataCriacao.value),
        });

        Get.find<LeadsController>().fetchLeads();
        Get.back();
        Get.snackbar(
          'Sucesso',
          'Lead criado com sucesso',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 2000),
        );

        nomeFantasia.value = '';
        nomeContato.value = '';
        celularContato.value = '';
        emailContato.value = '';
        observacao.value = '';
        disparaMensagem.value = false;
        sistema.value = '';
        valor.value = '';
        satisfeito.value = 1;
        escritorio.value = '';
        celularMask.text = '';
      } catch (e) {
        Get.snackbar(
          'Alerta',
          'Erro ao criar lead: $e',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 2000),
        );
      }
    }
  }

  Future<void> sendData(Map<String, dynamic> data) async {
    bool isConnected = await NetworkMonitor().checkConnection();
    if (isConnected) {
      await FirebaseFirestore.instance.collection('leads').add(data);
    } else {
      _box.add(data);
    }
  }

  void syncData() async {
    bool isConnected = await NetworkMonitor().checkConnection();
    if (isConnected) {
      List storedData = _box.values.toList();
      for (var data in storedData) {
        await FirebaseFirestore.instance.collection('leads').add(data);
      }
      _box.clear();
    }
  }

  void atualizaCelular(String value) {
    celularContato.value = value;
  }

  String removeNonNumeric(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }
}
