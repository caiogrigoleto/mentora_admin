import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentora_admin/models/Clientes.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';

class ClientesController extends GetxController {
  final RxList<ClientesModel> clientes = <ClientesModel>[].obs;
  final urlApi =
      'http://voti-admin-env.eba-9qa2jj8n.us-east-1.elasticbeanstalk.com';
  final AuthController authController = Get.put(AuthController());
  late RxString token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await getToken();
    await loadClients();
  }

  Future<void> getToken() async {
    final response = await http.post(
      Uri.parse('$urlApi/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          'username': 'araraquara@mentorasolucoes.com.br',
          'password': 'c4ca4238a0b923820dcc509a6f75849b',
        },
      ),
    );
    token.value = jsonDecode(response.body)['token'];
  }

  Future<void> loadClients() async {
    final response = await http.get(
      Uri.parse('$urlApi/api/v1/auth/cliente/revenda-pai?limit=1100'),
      headers: {
        'Authorization': 'Bearer ${token.value}',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);

      final Map<String, dynamic> jsonData = jsonDecode(responseBody);
      final List<dynamic> data = jsonData['_embedded']['lojaDTOList'];
      clientes.value = data.map((e) => ClientesModel.fromJson(e)).toList();
    } else {
      print('Failed to load clients');
    }
  }

  Future<void> updateClient(ClientesModel client) async {
    final response = await http.put(
      Uri.parse('$urlApi/api/v1/auth/cliente'),
      headers: {
        'Authorization': 'Bearer ${token.value}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 200) {
      loadClients();
      Get.snackbar('Success', 'Client updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update client');
    }
  }
}
