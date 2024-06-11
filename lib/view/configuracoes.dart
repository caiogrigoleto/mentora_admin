import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/configuracoes_controller.dart';

class Configuracoes extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(() => SwitchListTile(
                  title: const Text('Dark Theme'),
                  value: settingsController.isDarkTheme.value,
                  onChanged: (bool value) async {
                    settingsController.toggleTheme();
                    Get.changeTheme(
                      settingsController.isDarkTheme.value
                          ? ThemeData.dark()
                          : ThemeData.light(),
                    );
                    await Get.forceAppUpdate();
                  },
                )),
            Obx(() => SwitchListTile(
                  title: const Text('Enable Notifications'),
                  value: settingsController.isNotificationEnabled.value,
                  onChanged: (bool value) {
                    settingsController.toggleNotification();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
