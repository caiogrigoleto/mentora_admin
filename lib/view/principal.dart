import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';
import 'package:mentora_admin/controllers/principal_controller.dart';
import 'package:mentora_admin/view/configuracoes.dart';

class Principal extends StatelessWidget {
  final PrincipalController drawerController = Get.put(PrincipalController());
  final AuthController authController = Get.put(AuthController());

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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
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
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
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
