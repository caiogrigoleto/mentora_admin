import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';
import 'package:mentora_admin/controllers/principal_controller.dart';
import 'package:mentora_admin/services/user_services.dart';
import 'package:mentora_admin/utils/ThemeDataUtils.dart';
import 'package:mentora_admin/view/configuracoes.dart';
import 'package:mentora_admin/view/leads.dart';
import 'package:mentora_admin/view/lista_clientes.dart';

class Principal extends StatelessWidget {
  final PrincipalController drawerController = Get.put(PrincipalController());
  final AuthController authController = Get.put(AuthController());
  late FirebaseMessaging messaging;
  final storage = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerController.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: ThemeDataUtilsDark.DarkTheme.iconTheme,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Principal', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    child: Image.asset('lib/assets/user.png'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    authController.username.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.green),
              title: const Text('Principal'),
              onTap: () {
                Navigator.pop(context);
                Get.to(Principal());
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text(
                'Clientes',
              ),
              onTap: () {
                Navigator.pop(context);
                Get.to(const ListaClientes());
              },
            ),
            ListTile(
              leading: const Icon(Icons.list, color: Colors.green),
              title: const Text('Leads'),
              onTap: () {
                Navigator.pop(context);
                Get.to(const Leads());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.green),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                Get.to(Configuracoes());
              },
            ),
          ],
        ),
      ),
      body: PrincipalLayout(),
    );
  }

  Widget PrincipalLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/poweredby.png', // Caminho da sua logo
            height: 100, // Ajuste o tamanho conforme necessário
          ),
          const SizedBox(height: 20), // Espaço entre a logo e os registros
          Obx(() {
            if (drawerController.recordCount.value == 0) {
              return const Text('Nenhum lead registrado.');
            } else {
              return Text(
                'Você possui ${drawerController.recordCount.value} leads registrados.',
                style: const TextStyle(fontSize: 20),
              );
            }
          }),
        ],
      ),
    );
  }
}
