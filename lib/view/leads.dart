import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/view/lanca_lead.dart';

class Leads extends StatefulWidget {
  const Leads({Key? key}) : super(key: key);

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Leads'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(LancaLead());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
