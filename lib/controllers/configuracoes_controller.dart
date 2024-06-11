import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Estado para gerenciar o tema
  var isDarkTheme = false.obs;

  // Estado para gerenciar notificações
  var isNotificationEnabled = false.obs;

  // Método para alternar tema
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  // Método para alternar notificações
  void toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
  }
}
