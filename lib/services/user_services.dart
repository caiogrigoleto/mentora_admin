import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/models/User.dart';

class UserService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'users';

  // Método para criar ou atualizar um usuário
  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection(_collection).doc(user.id).set(user.toMap());
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  // Método para obter um usuário pelo ID
  Future<UserModel?> getUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(userId).get();
      return UserModel.fromDocument(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  Future<void> updateUserSettings(
      String userId, bool theme, bool notificacao) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(userId)
          .update({'theme': theme, 'notificacao': notificacao});
    } catch (e) {
      print('Error updating settings: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserSettings(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(userId).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      print('Error getting settings: $e');
      return null;
    }
  }

  // Método para deletar um usuário pelo ID
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection(_collection).doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
