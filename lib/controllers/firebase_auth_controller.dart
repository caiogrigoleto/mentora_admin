import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentora_admin/view/login.dart';
import 'package:mentora_admin/view/principal.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
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
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);
      Get.to(Principal());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAll(Login());
  }
}
