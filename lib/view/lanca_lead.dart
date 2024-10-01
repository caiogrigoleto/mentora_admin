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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Nome Fantasia',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      onChanged: (value) =>
                          controller.nomeContato.value = value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Nome do Contato',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: controller.celularMask,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Celular Contato',
                        hintText: '(99) 99999-9999',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      onChanged: (value) => controller.atualizaCelular(value),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      inputFormatters: [UpperCaseTextFormatter()],
                      onChanged: (value) => controller.sistema.value = value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Sistema Atual',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      onChanged: (value) => controller.valor.value = value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Valor Atual',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Card(
                      child: ExpansionTile(
                          title: Text(
                            "Endereço",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          children: <Widget>[
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) =>
                                      controller.endRua.value = value,
                                  inputFormatters: [UpperCaseTextFormatter()],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          // ignore: unnecessary_const
                                          const BorderRadius.all(
                                              const Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    labelText: 'Rua',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) =>
                                      controller.endNumero.value = value,
                                  inputFormatters: [UpperCaseTextFormatter()],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          // ignore: unnecessary_const
                                          const BorderRadius.all(
                                              const Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    labelText: 'Numero',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) =>
                                      controller.endBairro.value = value,
                                  inputFormatters: [UpperCaseTextFormatter()],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          // ignore: unnecessary_const
                                          const BorderRadius.all(
                                              const Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    labelText: 'Bairro',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: TextField(
                              //     onChanged: (value) =>
                              //         controller.endComplemento.value = value,
                              //     inputFormatters: [UpperCaseTextFormatter()],
                              //     decoration: InputDecoration(
                              //       enabledBorder: OutlineInputBorder(
                              //           borderRadius: const BorderRadius.all(
                              //             Radius.circular(5),
                              //           ),
                              //           borderSide: BorderSide(
                              //               color: Theme.of(context)
                              //                   .colorScheme
                              //                   .primary)),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderRadius:
                              //             // ignore: unnecessary_const
                              //             const BorderRadius.all(
                              //                 const Radius.circular(5)),
                              //         borderSide: BorderSide(
                              //             color: Theme.of(context)
                              //                 .colorScheme
                              //                 .primary),
                              //       ),
                              //       border: const OutlineInputBorder(
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(5)),
                              //       ),
                              //       labelText: 'Complemento',
                              //       labelStyle: TextStyle(
                              //           color: Theme.of(context)
                              //               .colorScheme
                              //               .primary),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: TextField(
                              //     onChanged: (value) =>
                              //         controller.endCidade.value = value,
                              //     inputFormatters: [UpperCaseTextFormatter()],
                              //     decoration: InputDecoration(
                              //       enabledBorder: OutlineInputBorder(
                              //           borderRadius: const BorderRadius.all(
                              //             Radius.circular(5),
                              //           ),
                              //           borderSide: BorderSide(
                              //               color: Theme.of(context)
                              //                   .colorScheme
                              //                   .primary)),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderRadius:
                              //             // ignore: unnecessary_const
                              //             const BorderRadius.all(
                              //                 const Radius.circular(5)),
                              //         borderSide: BorderSide(
                              //             color: Theme.of(context)
                              //                 .colorScheme
                              //                 .primary),
                              //       ),
                              //       border: const OutlineInputBorder(
                              //         borderRadius:
                              //             BorderRadius.all(Radius.circular(5)),
                              //       ),
                              //       labelText: 'Cidade/UF',
                              //       labelStyle: TextStyle(
                              //           color: Theme.of(context)
                              //               .colorScheme
                              //               .primary),
                              //     ),
                              //   ),
                              // ),
                            ]),
                          ]),
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
                      inputFormatters: [UpperCaseTextFormatter()],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              // ignore: unnecessary_const
                              const BorderRadius.all(const Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Escritório Contábil',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
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
                          controller.isChecked.value = value;
                        },
                      ),
                    ),
                    Obx(() {
                      if (controller.isChecked.value) {
                        return TextButton(
                          onPressed: () {
                            controller.pickDate(context);
                          },
                          child: Text("Selecione a data"),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    Obx(() {
                      String dateText = controller.selectedDate.value != null
                          ? 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(controller.selectedDate.value!)}'
                          : 'Nenhuma data selecionada';
                      return Text(dateText);
                    }),
                    const SizedBox(height: 10.0),
                    TextField(
                        onChanged: (value) =>
                            controller.observacao.value = value,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                // ignore: unnecessary_const
                                const BorderRadius.all(
                                    const Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          labelText: 'Observação',
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
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
