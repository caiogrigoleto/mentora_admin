import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsController extends GetxController {
  // Estado para gerenciar o tema
  var isDarkTheme = false.obs;

  // Estado para gerenciar notificações
  var isNotificationEnabled = false.obs;

  // Método para alternar tema
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    saveUserSettings();
  }

  // Método para alternar notificações
  void toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
    saveUserSettings();
  }

  @override
  void onInit() {
    super.onInit();
    loadUserSettings();
  }

  void loadUserSettings() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          var data = userDoc.data() as Map<String, dynamic>;
          isDarkTheme.value = data['theme'] ?? 'light';
          isNotificationEnabled.value = data['notifications'] ?? true;
        }
      }
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao carregar configurações: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUserSettings() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'theme': isDarkTheme.value,
          'notifications': isNotificationEnabled.value,
        }, SetOptions(merge: true));
      }
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao salvar configurações: $e',
          snackPosition: SnackPosition.TOP);
    }
  }
}
