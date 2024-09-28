import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/controllers/principal_controller.dart';
import 'package:mentora_admin/utils/ThemeDataUtils.dart';
import 'package:mentora_admin/view/lanca_lead.dart';
import 'package:mentora_admin/view/principal.dart';
import 'package:url_launcher/url_launcher.dart';

class Leads extends StatefulWidget {
  const Leads({Key? key}) : super(key: key);

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  final LeadsController controller = Get.put(LeadsController());

  void _launchURL(String url) async {
    // Verifica se o URL pode ser aberto
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Se não puder abrir, exibe uma mensagem de erro
      throw 'Não foi possível abrir o URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: ThemeDataUtilsDark.DarkTheme.iconTheme,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:
            const Text('Lista de Leads', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAll(Principal());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(LancaLead())?.then((value) => {
                controller.loadPendingData(),
              });
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
                  onTap: () {
                    _launchURL(
                        'https://portal.mentorasolucoes.com.br/restrito/crm/detalhes.php?unique=' +
                            data['id']);
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 25),
                    onPressed: () {
                      controller.deleteLead(data['id']);
                    },
                  ),
                );
              },
            ),
          );
        }),
        const Text('LEADS PENDENTES'),
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
