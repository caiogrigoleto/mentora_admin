import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrincipalController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var recordCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scaffoldKey.currentState?.openDrawer();
    });

    fetchRecordCount();
  }

  void fetchRecordCount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('leads') // Substitua pelo nome da sua coleção
            .where('userId', isEqualTo: user.uid)
            .get();

        recordCount.value = snapshot.docs.length;
        print("Contagem de leads: ${recordCount.value}");
      }
    } catch (e) {
      print("Erro ao recuperar leads do usuario: $e");
    }
  }
}
