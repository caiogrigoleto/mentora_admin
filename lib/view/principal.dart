import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';
import 'package:mentora_admin/controllers/principal_controller.dart';
import 'package:mentora_admin/services/user_services.dart';
import 'package:mentora_admin/view/configuracoes.dart';
import 'package:mentora_admin/view/leads.dart';

class Principal extends StatelessWidget {
  final PrincipalController drawerController = Get.put(PrincipalController());
  final AuthController authController = Get.put(AuthController());
  late FirebaseMessaging messaging;
  final storage = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
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
                  Container(
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
              leading: const Icon(Icons.home),
              title: const Text('Principal'),
              onTap: () {
                Navigator.pop(context);
                Get.to(Principal());
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Leads'),
              onTap: () {
                Navigator.pop(context);
                Get.to(const Leads());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                Get.to(Configuracoes());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: const Center(
        child: Text('Settings Screen Content'),
      ),
    );
  }
}
