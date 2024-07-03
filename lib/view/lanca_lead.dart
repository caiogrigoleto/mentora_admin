import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/view/leads.dart';

class LancaLead extends StatelessWidget {
  final LeadsController controller = Get.put(LeadsController());
  bool _sendMessages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lançamento de Lead'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 20.0,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      onChanged: (value) =>
                          controller.nomeFantasia.value = value,
                      decoration:
                          const InputDecoration(labelText: 'Nome Fantasia'),
                    ),
                    TextField(
                      onChanged: (value) =>
                          controller.nomeContato.value = value,
                      decoration:
                          const InputDecoration(labelText: 'Nome do Contato'),
                    ),
                    TextField(
                      onChanged: (value) =>
                          controller.celularContato.value = value,
                      decoration: const InputDecoration(
                          labelText: 'Celular do Contato'),
                    ),
                    TextField(
                      onChanged: (value) =>
                          controller.emailContato.value = value,
                      decoration:
                          const InputDecoration(labelText: 'Email do Contato'),
                    ),
                    const SizedBox(height: 16.0),
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('Enviar Mensagem para Gerente'),
                        value: controller.disparaMensagem.value,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          controller.disparaMensagem.value = value!;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Obx(() => Text(
                        'Data de Criação: ${DateFormat('dd/MM/yyyy').format(controller.dataCriacao.value)}')),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        controller.saveLead();
                      },
                      child: const Text('Salvar Lead'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
