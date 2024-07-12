import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentora_admin/controllers/configuracoes_controller.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/services/user_services.dart';
import 'package:mentora_admin/utils/NetworkMonitor.dart';
import 'package:mentora_admin/view/login.dart';
import 'package:mentora_admin/view/principal.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  final storage = UserService();
  final NetworkMonitor networkMonitor = NetworkMonitor();
  late bool isConection;

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final username = ''.obs;

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
    isConection = await networkMonitor.checkConnection();
    if (!isConection) {
      var credentials = await storage.getCredentials();
      Get.snackbar('Error', 'Sem conexão',
          backgroundColor: Colors.red, colorText: Colors.white);
      if (email == credentials['username'] &&
          password == credentials['password']) {
        settingsController.loadUserSettings();
        getUsername();
        Get.to(Principal());
      } else {
        Get.snackbar('Usuário ou senha inválidos', '',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print(fcmToken);
        settingsController.loadUserSettings();
        storage.saveCredentials(email, password);
        Get.to(Principal());
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
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

  void getUsername() {
    username.value = usernameController.value.text;
  }

  void setUsername(String username) {
    usernameController.value.text = username;
  }

  void setPassword(String password) {
    passwordController.value.text = password;
  }
}
