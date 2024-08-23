import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrincipalController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scaffoldKey.currentState?.openDrawer();
    });
  }
}
