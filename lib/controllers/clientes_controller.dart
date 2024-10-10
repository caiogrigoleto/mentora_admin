import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentora_admin/models/Clientes.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';
import 'package:crypto/crypto.dart';

class ClientesController extends GetxController {
  final RxList<ClientesModel> clientes = <ClientesModel>[].obs;
  final urlApiAdmin =
      'http://voti-admin-env.eba-9qa2jj8n.us-east-1.elasticbeanstalk.com';
  final urlApiVoti =
      'http://votiintegra-env-1.eba-cpn2chma.us-east-1.elasticbeanstalk.com';
  final AuthController authController = Get.put(AuthController());
  late RxString tokenAdmin = ''.obs;
  late RxString tokenVoti = ''.obs;

  late String username = authController.username.value;
  late String password = authController.password.value;

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  void onInit() {
    super.onInit();
    //getToken();
    //loadData();
  }

  Future<void> loadData() async {
    await getToken();
    await loadClients();
  }

  Future<void> getToken() async {
    final response = await http.post(
      Uri.parse('$urlApiAdmin/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'password': generateMd5(password),
        },
      ),
    );
    tokenAdmin.value = jsonDecode(response.body)['token'];
  }

  Future<void> getTokenVoti() async {
    final response = await http.post(
      Uri.parse('$urlApiVoti/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'password': password,
        },
      ),
    );
    tokenVoti.value = jsonDecode(response.body)['token'];
  }

  Future<void> loadClients() async {
    await getToken();
    final response = await http.get(
      Uri.parse('$urlApiAdmin/api/v1/auth/cliente?limit=1000'),
      headers: {
        'Authorization': 'Bearer ${tokenAdmin.value}',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);

      final Map<String, dynamic> jsonData = jsonDecode(responseBody);
      final List<dynamic> data = jsonData['_embedded']['lojaDTOList'];
      clientes.value = data.map((e) => ClientesModel.fromJson(e)).toList();
    } else {
      Get.snackbar(
        'Erro!',
        'Falha ao carregar os clientes',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateClient(ClientesModel client) async {
    final response = await http.put(
      Uri.parse('$urlApiAdmin/api/v1/auth/cliente'),
      headers: {
        'Authorization': 'Bearer ${tokenAdmin.value}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 200) {
      //loadClients();
      Get.snackbar('Sucesso!', 'Cliente atualizado com sucesso!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else {
      Get.snackbar(
        'Erro!',
        'Falha ao atualizar o cliente',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> resetSenha(String email) async {
    final response = await http.put(
      Uri.parse('$urlApiVoti/v1/atualizar-senha'),
      headers: {
        'Authorization': 'Bearer ${tokenVoti.value}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'desEmail': email,
        },
      ),
    );

    if (response.statusCode == 200) {
      //loadClients();
      Get.snackbar('Sucesso!', 'Senha resetada com sucesso! NOVA SENHA: 1',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else {
      Get.snackbar(
        'Erro!',
        'Falha ao resetar senha do cliente',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> aumentaTrial(String email) async {
    final response = await http.put(
      Uri.parse('$urlApiVoti/v1/aumentar-trial'),
      headers: {
        'Authorization': 'Bearer ${tokenVoti.value}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'desEmail': email,
        },
      ),
    );

    print(jsonDecode(response.body)['mesage']);

    if (response.statusCode == 200) {
      //loadClients();
      Get.snackbar(
          'Sucesso!',
          'Trial aumentada com sucesso! NOVA DATA: ' +
              jsonDecode(response.body)['dataVencimentoTrial'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else if (response.statusCode == 400) {
      Get.snackbar(
        'Alerta!',
        jsonDecode(response.body)['mesage'],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Erro!',
        'Falha ao aumentar trial do cliente',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
