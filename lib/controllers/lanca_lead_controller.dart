import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class LeadsController extends GetxController {
  final RxString id = ''.obs;
  final RxString nomeFantasia = ''.obs;
  final RxString nomeContato = ''.obs;
  final RxString celularContato = ''.obs;
  final RxString emailContato = ''.obs;
  final RxBool disparaMensagem = false.obs;
  var dataCriacao = DateTime.now().obs;

  void saveLead() {
    if (nomeFantasia.isEmpty || nomeContato.isEmpty || celularContato.isEmpty) {
      Get.snackbar(
        'Alerta',
        'Por favor, preencha todos os campos',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 2000),
      );
      return;
    } else {
      if (disparaMensagem.value) {}

      Get.back();

      Get.snackbar(
        'Sucesso',
        'Lead criado com sucesso',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 2000),
      );

      nomeFantasia.value = '';
      nomeContato.value = '';
      celularContato.value = '';
      emailContato.value = '';
      disparaMensagem.value = false;
    }
  }
}
