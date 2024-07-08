import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentora_admin/controllers/configuracoes_controller.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/services/user_services.dart';
import 'package:mentora_admin/view/login.dart';
import 'package:mentora_admin/view/principal.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  final storage = UserService();

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  User? get user => _firebaseUser.value;
  SettingsController settingsController = Get.find<SettingsController>();

  @override
  void onClose() {
    usernameController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
    _loadCredentials();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // if (Platform.isAndroid) {
      //   final fcmToken = await FirebaseMessaging.instance.getToken();
      //   print(fcmToken);
      // }

      settingsController.loadUserSettings();
      storage.saveCredentials(email, password);
      Get.to(Principal());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void signOut() async {
    await _auth.signOut();
    LeadsController().dispose();
    Get.offAll(Login());
  }

  Future<void> _loadCredentials() async {
    var credentials = await storage.getCredentials();

    setUsername(credentials['username'] ?? '');
  }

  void setUsername(String username) {
    usernameController.value.text = username;
  }

  void setPassword(String password) {
    passwordController.value.text = password;
  }
}
