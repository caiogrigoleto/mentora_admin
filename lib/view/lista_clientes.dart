import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mentora_admin/controllers/clientes_controller.dart';
import 'package:mentora_admin/models/Clientes.dart';
import 'package:mentora_admin/utils/ThemeDataUtils.dart';
import 'package:mentora_admin/view/edit_cliente.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({super.key});

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  final ClientesController clientesController = Get.put(ClientesController());
  final TextEditingController searchController = TextEditingController();
  final TextEditingController revendaController = TextEditingController();
  final RxList<ClientesModel> filteredClients = <ClientesModel>[].obs;
  final RxString selectedFilter = ''.obs;

  @override
  void initState() {
    super.initState();
    // Load clients and initialize the filtered list
    clientesController.loadClients().then((_) {
      filteredClients.addAll(clientesController.clientes);
    });
    searchController.addListener(_filterClients);
    revendaController.addListener(_filterClients);
  }

  void _filterClients() {
    final query = searchController.text.toUpperCase();
    final revendaQuery = revendaController.text.toUpperCase();

    filteredClients.value = clientesController.clientes.where((client) {
      final matchesQuery = (client.desFantasia
                  ?.toUpperCase()
                  .contains(query.toUpperCase()) ??
              false) ||
          (client.desRazaoSocial?.toUpperCase().contains(query.toUpperCase()) ??
              false) ||
          (client.numCnpj?.contains(query) ?? false) ||
          (client.desEmail?.toLowerCase().contains(query.toLowerCase()) ??
              false);

      final matchesFilter = selectedFilter.value == ''
          ? true
          : selectedFilter.value == 'Bloqueados'
              ? client.flgBloqueado == true
              : selectedFilter.value == 'Cancelados'
                  ? client.flgCancelado ==
                      true // assuming there is an `isCancelled` field
                  : selectedFilter.value == 'Código da Revenda'
                      ? client.revendaId
                              ?.toUpperCase()
                              .contains(revendaQuery) ??
                          false
                      : false;

      return matchesQuery && matchesFilter;
    }).toList();
  }

  @override
  void dispose() {
    searchController.removeListener(_filterClients);
    searchController.dispose();
    revendaController.removeListener(_filterClients);
    revendaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: ThemeDataUtilsDark.DarkTheme.iconTheme,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar Clientes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                Obx(() => Column(
                      children: [
                        DropdownButton<String>(
                          value: selectedFilter.value.isEmpty
                              ? null
                              : selectedFilter.value,
                          hint: const Text('Selecionar Filtro'),
                          items: <String>[
                            'Todos',
                            'Bloqueados',
                            'Cancelados',
                            'Código da Revenda'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedFilter.value =
                                newValue == 'Todos' ? '' : newValue!;
                            _filterClients();
                          },
                        ),
                        if (selectedFilter.value == 'Código da Revenda')
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextField(
                              controller: revendaController,
                              decoration: InputDecoration(
                                hintText: 'Inserir Código da Revenda',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                      ],
                    )),
              ],
            ),
          ),
          Obx(
            () => Text(
              '${filteredClients.length} clientes encontrados',
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: filteredClients.length,
                itemBuilder: (context, index) {
                  final data = filteredClients[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Get.to(() => EditClientScreen(
                                cliente: filteredClients[index]));
                          },
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Editar',
                        ),
                        data.flgBloqueado == false
                            ? SlidableAction(
                                onPressed: (context) async {
                                  data.flgBloqueado = true;
                                  await clientesController
                                      .updateClient(data)
                                      .then((value) {
                                    Get.snackbar('Sucesso!',
                                        'Cliente bloqueado com sucesso!',
                                        colorText: Colors.white,
                                        backgroundColor: Colors.green,
                                        snackPosition: SnackPosition.BOTTOM);
                                  });
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Bloquear',
                              )
                            : SlidableAction(
                                onPressed: (context) async {
                                  data.flgBloqueado = false;
                                  await clientesController.updateClient(data);
                                },
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Desbloquear',
                              ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            AlertDialog alert = AlertDialog(
                              title: const Text('Confirmar'),
                              content: Text(
                                  'Tem certeza que deseja aumentar o trial do cliente ${data.desFantasia}?'),
                              actions: [
                                TextButton(
                                  child: const Text('Não'),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Sim'),
                                  onPressed: () async {
                                    data.vencimentoTrial = '';
                                    await clientesController
                                        .updateClient(data)
                                        .then((value) {
                                      Get.snackbar('Sucesso!',
                                          'Trial alterado para mais 5 dias');
                                      Get.back();
                                    });
                                  },
                                ),
                              ],
                            );

                            showDialog(
                                context: context, builder: (context) => alert);
                          },
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Trial',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Senha',
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(data.desFantasia ?? 'Sem nome'),
                      subtitle: Text(data.idLoja?.toString() ?? 'Sem ID'),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
