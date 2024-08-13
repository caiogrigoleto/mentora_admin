import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:mentora_admin/controllers/edit_clientes_controller.dart';
import 'package:mentora_admin/models/Clientes.dart';

class EditClientScreen extends StatelessWidget {
  final ClientesModel cliente;

  EditClientScreen({super.key, required this.cliente});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final EditClientController editClientController =
        Get.put(EditClientController(cliente: cliente));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Editar Cliente'),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Dados'),
              Tab(text: 'Preços'),
              Tab(text: 'Módulos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: editClientController.desRazaoSocial.value,
                      decoration:
                          const InputDecoration(labelText: 'Razão Social'),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                      onSaved: (value) =>
                          editClientController.desRazaoSocial.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.desFantasia.value,
                      decoration:
                          const InputDecoration(labelText: 'Nome Fantasia'),
                      onSaved: (value) =>
                          editClientController.desFantasia.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.numCnpj.value,
                      decoration: const InputDecoration(labelText: 'CNPJ'),
                      onSaved: (value) =>
                          editClientController.numCnpj.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.desEndereco.value,
                      decoration: const InputDecoration(labelText: 'Endereço'),
                      onSaved: (value) =>
                          editClientController.desEndereco.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.desEmail.value,
                      decoration: const InputDecoration(labelText: 'Email'),
                      onSaved: (value) =>
                          editClientController.desEmail.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.numFone.value,
                      decoration: const InputDecoration(labelText: 'Telefone'),
                      onSaved: (value) =>
                          editClientController.numFone.value = value,
                    ),
                    TextFormField(
                      initialValue: editClientController.numCel.value,
                      decoration: const InputDecoration(labelText: 'Celular'),
                      onSaved: (value) =>
                          editClientController.numCel.value = value,
                    ),
                    const SizedBox(height: 20),
                    const Text('Status'),
                    Row(
                      children: [
                        Obx(
                          () => Switch(
                              value: editClientController.flgBloqueado.value!,
                              onChanged: (_) {
                                editClientController.flgBloqueado.value =
                                    !editClientController.flgBloqueado.value!;
                              }),
                        ),
                        const SizedBox(width: 10),
                        const Text('Bloqueado'),
                        const SizedBox(width: 20),
                        Obx(
                          () => Switch(
                              value: editClientController.flgCancelado.value!,
                              onChanged: (_) {
                                editClientController.flgCancelado.value =
                                    !editClientController.flgCancelado.value!;
                              }),
                        ),
                        const SizedBox(width: 10),
                        const Text('Cancelado'),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Switch(
                              value:
                                  editClientController.flgInadimplente.value!,
                              onChanged: (_) {
                                editClientController.flgInadimplente.value =
                                    !editClientController
                                        .flgInadimplente.value!;
                              }),
                        ),
                        const SizedBox(width: 10),
                        const Text('Inadimplente'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          editClientController.updateClient();

                          Get.back();
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextFormField(
                    initialValue:
                        editClientController.valContratacao.value.toString(),
                    decoration:
                        const InputDecoration(labelText: 'Valor Contratação'),
                    onSaved: (value) => editClientController
                        .valContratacao.value = double.parse(value!),
                  ),
                  TextFormField(
                    initialValue:
                        editClientController.valDistribuidor.value.toString(),
                    decoration:
                        const InputDecoration(labelText: 'Valor Distribuidor'),
                    onSaved: (value) => editClientController
                        .valDistribuidor.value = double.parse(value!),
                  ),
                  TextFormField(
                    initialValue:
                        editClientController.valFabricante.value.toString(),
                    decoration:
                        const InputDecoration(labelText: 'Valor Fabricante'),
                    onSaved: (value) => editClientController
                        .valFabricante.value = double.parse(value!),
                  ),
                  TextFormField(
                    initialValue:
                        editClientController.valTerceiros.value.toString(),
                    decoration:
                        const InputDecoration(labelText: 'Valor Terceiros'),
                    onSaved: (value) => editClientController
                        .valTerceiros.value = double.parse(value!),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloNfse.value!,
                            onChanged: (_) {
                              editClientController.flgModuloNfse.value =
                                  !editClientController.flgModuloNfse.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo NFSe'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloVenda.value!,
                            onChanged: (_) {
                              editClientController.flgModuloVenda.value =
                                  !editClientController.flgModuloVenda.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Venda'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value:
                                editClientController.flgModuloSATNFCeNFe.value!,
                            onChanged: (_) {
                              editClientController.flgModuloSATNFCeNFe.value =
                                  !editClientController
                                      .flgModuloSATNFCeNFe.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo SAT/NFCe/NFe'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value:
                                editClientController.flgModuloFinanceiro.value!,
                            onChanged: (_) {
                              editClientController.flgModuloFinanceiro.value =
                                  !editClientController
                                      .flgModuloFinanceiro.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Financeiro'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloCompra.value!,
                            onChanged: (_) {
                              editClientController.flgModuloCompra.value =
                                  !editClientController.flgModuloCompra.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Compra'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloEstoque.value!,
                            onChanged: (_) {
                              editClientController.flgModuloEstoque.value =
                                  !editClientController.flgModuloEstoque.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Estoque'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloBoleto.value!,
                            onChanged: (_) {
                              editClientController.flgModuloBoleto.value =
                                  !editClientController.flgModuloBoleto.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Boleto'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloMdfe.value!,
                            onChanged: (_) {
                              editClientController.flgModuloMdfe.value =
                                  !editClientController.flgModuloMdfe.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo MDFe'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloSped.value!,
                            onChanged: (_) {
                              editClientController.flgModuloSped.value =
                                  !editClientController.flgModuloSped.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo SPED'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value:
                                editClientController.flgModuloEcommerce.value!,
                            onChanged: (_) {
                              editClientController.flgModuloEcommerce.value =
                                  !editClientController
                                      .flgModuloEcommerce.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Ecommerce'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController
                                .flgModuloMidiaIndoor.value!,
                            onChanged: (_) {
                              editClientController.flgModuloMidiaIndoor.value =
                                  !editClientController
                                      .flgModuloMidiaIndoor.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Midia Indoor'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value:
                                editClientController.flgModuloDelivery.value!,
                            onChanged: (_) {
                              editClientController.flgModuloDelivery.value =
                                  !editClientController
                                      .flgModuloDelivery.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Delivery'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value:
                                editClientController.flgModuloMarketing.value!,
                            onChanged: (_) {
                              editClientController.flgModuloMarketing.value =
                                  !editClientController
                                      .flgModuloMarketing.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Marketing'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController
                                .flgModuloContabilidade.value!,
                            onChanged: (_) {
                              editClientController
                                      .flgModuloContabilidade.value =
                                  !editClientController
                                      .flgModuloContabilidade.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Contabilidade'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloSalao.value!,
                            onChanged: (_) {
                              editClientController.flgModuloSalao.value =
                                  !editClientController.flgModuloSalao.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Salão'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloClinica.value!,
                            onChanged: (_) {
                              editClientController.flgModuloClinica.value =
                                  !editClientController.flgModuloClinica.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Clínica'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController.flgModuloAgro.value!,
                            onChanged: (_) {
                              editClientController.flgModuloAgro.value =
                                  !editClientController.flgModuloAgro.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Agro'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                            value: editClientController
                                .flgModuloRestaurante.value!,
                            onChanged: (_) {
                              editClientController.flgModuloRestaurante.value =
                                  !editClientController
                                      .flgModuloRestaurante.value!;
                            }),
                      ),
                      const SizedBox(width: 20),
                      const Text('Modulo Restaurante'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
