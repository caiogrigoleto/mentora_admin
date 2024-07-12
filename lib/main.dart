import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mentora_admin/controllers/configuracoes_controller.dart';
import 'package:mentora_admin/firebase_options.dart';
import 'package:mentora_admin/services/sync_service.dart';
import 'package:mentora_admin/utils/ThemeDataUtils.dart';
import 'package:mentora_admin/view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Hive.initFlutter();
  await Hive.openBox("offlineData");
  runApp(MentoraAdmin());
  SyncService();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MentoraAdmin extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentora Admin',
      home: Login(),
      theme: settingsController.isDarkTheme.value
          ? ThemeDataUtilsDark.DarkTheme
          : ThemeDataUtilsLight.LightTheme,
    );
  }
}
