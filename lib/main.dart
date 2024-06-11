import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/configuracoes_controller.dart';
import 'package:mentora_admin/firebase_options.dart';
import 'package:mentora_admin/view/login.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mentora Admin',
      home: Login(),
      theme: settingsController.isDarkTheme.value
          ? ThemeData.dark()
          : ThemeData.light(),
    );
  }
}
