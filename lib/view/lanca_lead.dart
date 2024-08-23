import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/lanca_lead_controller.dart';
import 'package:mentora_admin/services/all_services.dart';
import 'package:mentora_admin/utils/ThemeDataUtils.dart';

class LancaLead extends StatelessWidget {
  final LeadsController controller = Get.put(LeadsController());
  bool _sendMessages = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: ThemeDataUtilsDark.DarkTheme.iconTheme,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Lançamento de Lead',
            style: TextStyle(color: Colors.white)),
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
                      inputFormatters: [UpperCaseTextFormatter()],
                      onChanged: (value) =>
                          controller.nomeFantasia.value = value,
                      decoration: const InputDecoration(
                        labelText: 'Nome Fantasia',
                      ),
                    ),
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      onChanged: (value) =>
                          controller.nomeContato.value = value,
                      decoration:
                          const InputDecoration(labelText: 'Nome do Contato'),
                    ),
                    TextField(
                      controller: controller.celularMask,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Celular do Contato',
                        hintText: '(99) 99999-9999',
                      ),
                      onChanged: (value) => controller.atualizaCelular(value),
                    ),
                    TextField(
                      onChanged: (value) => controller.sistema.value = value,
                      decoration:
                          const InputDecoration(labelText: 'Sistema Atual'),
                    ),
                    TextField(
                      onChanged: (value) => controller.valor.value = value,
                      decoration: const InputDecoration(
                          labelText: 'Valor que paga hoje'),
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Satisfeito com o sistema?'),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => Radio(
                                  value: 1,
                                  onChanged: (value) {
                                    controller.satisfeito.value = 1;
                                  },
                                  groupValue: controller.satisfeito.value,
                                ),
                              ),
                              const Text('Sim'),
                              Obx(
                                () => Radio(
                                  value: 2,
                                  onChanged: (value) {
                                    controller.satisfeito.value = 2;
                                  },
                                  groupValue: controller.satisfeito.value,
                                ),
                              ),
                              const Text('Nenhum'),
                              Obx(
                                () => Radio(
                                  value: 0,
                                  onChanged: (value) {
                                    controller.satisfeito.value = 0;
                                  },
                                  groupValue: controller.satisfeito.value,
                                ),
                              ),
                              const Text('Não'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Suporte deles é bom?'),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => Radio(
                                  value: 1,
                                  onChanged: (value) {
                                    controller.suporte.value = 1;
                                  },
                                  groupValue: controller.suporte.value,
                                ),
                              ),
                              const Text('Sim'),
                              Obx(
                                () => Radio(
                                  value: 2,
                                  onChanged: (value) {
                                    controller.suporte.value = 2;
                                  },
                                  groupValue: controller.suporte.value,
                                ),
                              ),
                              const Text('Nenhum'),
                              Obx(
                                () => Radio(
                                  value: 0,
                                  onChanged: (value) {
                                    controller.suporte.value = 0;
                                  },
                                  groupValue: controller.suporte.value,
                                ),
                              ),
                              const Text('Não'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Atendimento rápido?'),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(
                                () => Radio(
                                  value: 1,
                                  onChanged: (value) {
                                    controller.atendimento.value = 1;
                                  },
                                  groupValue: controller.atendimento.value,
                                ),
                              ),
                              const Text('Sim'),
                              Obx(
                                () => Radio(
                                  value: 2,
                                  onChanged: (value) {
                                    controller.atendimento.value = 2;
                                  },
                                  groupValue: controller.atendimento.value,
                                ),
                              ),
                              const Text('Nenhum'),
                              Obx(
                                () => Radio(
                                  value: 0,
                                  onChanged: (value) {
                                    controller.atendimento.value = 0;
                                  },
                                  groupValue: controller.atendimento.value,
                                ),
                              ),
                              const Text('Não'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      onChanged: (value) => controller.escritorio.value = value,
                      decoration: const InputDecoration(
                          labelText: 'Escritório Contábil'),
                    ),
                    const SizedBox(height: 16.0),
                    Obx(
                      () => CheckboxListTile(
                        title: const Text('Enviar Mensagem para Gerente',
                            style: TextStyle(fontSize: 14)),
                        value: controller.disparaMensagem.value,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          controller.disparaMensagem.value = value!;
                        },
                      ),
                    ),
                    TextField(
                        onChanged: (value) =>
                            controller.observacao.value = value,
                        decoration:
                            const InputDecoration(labelText: 'Observação'),
                        maxLines: 5),
                    const SizedBox(height: 16.0),
                    Obx(() => Text(
                        'Data de Criação:  ${DateFormat('dd/MM/yyyy').format(controller.dataCriacao.value)}')),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white),
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
