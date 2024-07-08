import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:intl/intl.dart';
import 'package:mentora_admin/view/lanca_lead.dart';

class Leads extends StatefulWidget {
  const Leads({Key? key}) : super(key: key);

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  final LeadsController controller = Get.put(LeadsController());

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
      body: Column(children: [
        const SizedBox(height: 20),
        const Text('LEADS'),
        Obx(() {
          if (controller.leadsList.isEmpty) {
            return const Center(child: Text('Nenhum lead encontrado.'));
          }
          return Expanded(
            child: ListView.builder(
              itemCount: controller.leadsList.length,
              itemBuilder: (context, index) {
                final data = controller.leadsList[index];
                return ListTile(
                  title:
                      Text(data['nomeFantasia'] + ' - ' + data['nomeContato']),
                  subtitle: Text(data['dataCriacao'].toString()),
                );
              },
            ),
          );
        }),
        const Text('DADOS PENDENTES'),
        Obx(() {
          if (controller.pendingData.isEmpty) {
            return const Center(child: Text('Nenhum dado pendente.'));
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.pendingData.length,
                itemBuilder: (context, index) {
                  final data = controller.pendingData[index];
                  return ListTile(
                    title: Text(
                        data['nomeFantasia'] + ' - ' + data['nomeContato']),
                    subtitle: Text(data['dataCriacao']),
                  );
                },
              ),
            );
          }
        })
      ]),
    );
  }
}
