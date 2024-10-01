import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/fcm_controller.dart';
import 'package:mentora_admin/controllers/firebase_auth_controller.dart';

class Login extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final FCMController fcmController = Get.put(FCMController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/background.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/logo.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'Acesso Mentora Admin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 32.0), // Add some spacing
                  TextField(
                    controller: authController.usernameController.value,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: authController.passwordController.value,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      var email = authController.usernameController.value.text;
                      var password =
                          authController.passwordController.value.text;

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar('Alerta', 'Por favor preencha os dados',
                            backgroundColor: Colors.orange,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            animationDuration:
                                const Duration(milliseconds: 2000));
                      } else {
                        authController.login(email, password);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('Entrar',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 50.0),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('lib/assets/poweredby.png', height: 60),
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Versão 1.0.3'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
