import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FCMController extends GetxController {
  late FirebaseMessaging messaging;

  @override
  void onInit() {
    super.onInit();
    _initializeFCM();
  }

  void _initializeFCM() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;

    // Solicitar permissões para notificações no iOS
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Usuário concedeu permissão');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Usuário concedeu permissão provisória');
    } else {
      print('Usuário não concedeu permissão');
    }

    // Obter o token do dispositivo
    String? token = await messaging.getToken();
    print("FCM Token: $token");

    // Configurar manipuladores de mensagens
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "Mensagem recebida: ${message.notification?.title}, ${message.notification?.body}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "Mensagem aberta: ${message.notification?.title}, ${message.notification?.body}");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print(
        "Mensagem recebida em segundo plano: ${message.notification?.title}, ${message.notification?.body}");
  }
}
