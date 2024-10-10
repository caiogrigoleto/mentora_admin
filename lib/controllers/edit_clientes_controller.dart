import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mentora_admin/controllers/clientes_controller.dart';
import 'package:mentora_admin/models/Clientes.dart';

class EditClientController extends GetxController {
  final ClientesController clientesController = Get.find();
  final ClientesModel cliente;

  EditClientController({required this.cliente});

  // Observables para os campos do formulário
  final Rx<int?> idLoja = Rx<int?>(null);
  final Rx<int?> numLoja = Rx<int?>(null);
  final Rx<int?> tpoRegime = Rx<int?>(null);
  final Rx<String?> desRazaoSocial = Rx<String?>(null);
  final Rx<String?> desFantasia = Rx<String?>(null);
  final Rx<String?> numCnpj = Rx<String?>(null);
  final Rx<String?> numInscEstadual = Rx<String?>(null);
  final Rx<String?> numInscMunicipal = Rx<String?>(null);
  final Rx<String?> desEndereco = Rx<String?>(null);
  final Rx<String?> numEndereco = Rx<String?>(null);
  final Rx<String?> desBairro = Rx<String?>(null);
  final Rx<String?> desComplemento = Rx<String?>(null);
  final Rx<String?> desObs = Rx<String?>(null);
  final Rx<String?> desMotivoCancelamento = Rx<String?>(null);
  final Rx<String?> numCep = Rx<String?>(null);
  final Rx<String?> desEmail = Rx<String?>(null);
  final Rx<int?> tpoRamoAtividade = Rx<int?>(null);
  final Rx<int?> idConta = Rx<int?>(null);
  final Rx<double?> valJurosFinanceiro = Rx<double?>(null);
  final Rx<double?> valMultaFinanceiro = Rx<double?>(null);
  final Rx<String?> empresaDesTipoLicenca = Rx<String?>(null);
  final Rx<String?> cidade = Rx<String?>(null);
  final Rx<String?> numFone = Rx<String?>(null);
  final Rx<String?> numCel = Rx<String?>(null);
  final Rx<double?> valAliqSimples = Rx<double?>(null);
  final Rx<bool?> flgValidarEstoqueVenda = Rx<bool?>(null);
  final Rx<bool?> flgInadimplente = Rx<bool?>(null);
  final Rx<bool?> flgCancelado = Rx<bool?>(null);
  final Rx<bool?> flgBloqueado = Rx<bool?>(null);
  final Rx<bool?> flgBloqueadoPelaRevenda = Rx<bool?>(null);
  final Rx<String?> dtaCadastro = Rx<String?>(null);
  final Rx<String?> dtaAlteracao = Rx<String?>(null);
  final Rx<String?> dtaContratacao = Rx<String?>(null);
  final Rx<String?> dtaCancelamento = Rx<String?>(null);
  final Rx<String?> dtaDesbloqueio = Rx<String?>(null);
  final Rx<String?> desRazaoSocialContador = Rx<String?>(null);
  final Rx<String?> desEmailContador = Rx<String?>(null);
  final Rx<double?> valContratacao = Rx<double?>(null);
  final Rx<double?> valFabricante = Rx<double?>(null);
  final Rx<double?> valDistribuidor = Rx<double?>(null);
  final Rx<double?> valSubRevenda = Rx<double?>(null);
  final Rx<double?> valTerceiros = Rx<double?>(null);
  final Rx<bool?> flgModuloNfse = Rx<bool?>(null);
  final Rx<bool?> flgModuloVenda = Rx<bool?>(null);
  final Rx<bool?> flgModuloSATNFCeNFe = Rx<bool?>(null);
  final Rx<bool?> flgModuloFinanceiro = Rx<bool?>(null);
  final Rx<bool?> flgModuloCompra = Rx<bool?>(null);
  final Rx<bool?> flgModuloEstoque = Rx<bool?>(null);
  final Rx<bool?> flgModuloBoleto = Rx<bool?>(null);
  final Rx<bool?> flgModuloMdfe = Rx<bool?>(null);
  final Rx<bool?> flgModuloSped = Rx<bool?>(null);
  final Rx<bool?> flgModuloEcommerce = Rx<bool?>(null);
  final Rx<bool?> flgModuloMidiaIndoor = Rx<bool?>(null);
  final Rx<bool?> flgModuloDelivery = Rx<bool?>(null);
  final Rx<bool?> flgModuloMarketing = Rx<bool?>(null);
  final Rx<bool?> flgModuloContabilidade = Rx<bool?>(null);
  final Rx<bool?> flgModuloSalao = Rx<bool?>(null);
  final Rx<bool?> flgModuloClinica = Rx<bool?>(null);
  final Rx<bool?> flgModuloAgro = Rx<bool?>(null);
  final Rx<bool?> flgModuloRestaurante = Rx<bool?>(null);
  final Rx<String?> vencimentoTrial = Rx<String?>(null);
  final Rx<int?> empresaId = Rx<int?>(null);
  final Rx<String?> revendaId = Rx<String?>(null);
  final Rx<String?> revendaPaiId = Rx<String?>(null);
  final Rx<bool?> flgRevenda = Rx<bool?>(null);

  @override
  void onInit() {
    super.onInit();
    // Inicializa os valores observáveis com os dados do cliente
    idLoja.value = cliente.idLoja;
    numLoja.value = cliente.numLoja;
    tpoRegime.value = cliente.tpoRegime;
    desRazaoSocial.value = cliente.desRazaoSocial;
    desFantasia.value = cliente.desFantasia;
    numCnpj.value = cliente.numCnpj;
    numInscEstadual.value = cliente.numInscEstadual;
    numInscMunicipal.value = cliente.numInscMunicipal;
    desEndereco.value = cliente.desEndereco;
    numEndereco.value = cliente.numEndereco;
    desBairro.value = cliente.desBairro;
    desComplemento.value = cliente.desComplemento;
    desObs.value = cliente.desObs;
    desMotivoCancelamento.value = cliente.desMotivoCancelamento;
    numCep.value = cliente.numCep;
    desEmail.value = cliente.desEmail;
    tpoRamoAtividade.value = cliente.tpoRamoAtividade;
    idConta.value = cliente.idConta;
    valJurosFinanceiro.value = cliente.valJurosFinanceiro;
    valMultaFinanceiro.value = cliente.valMultaFinanceiro;
    empresaDesTipoLicenca.value = cliente.empresaDesTipoLicenca;
    cidade.value = cliente.cidade;
    numFone.value = cliente.numFone;
    numCel.value = cliente.numCel;
    valAliqSimples.value = cliente.valAliqSimples;
    flgValidarEstoqueVenda.value = cliente.flgValidarEstoqueVenda;
    flgInadimplente.value = cliente.flgInadimplente;
    flgCancelado.value = cliente.flgCancelado;
    flgBloqueado.value = cliente.flgBloqueado;
    flgBloqueadoPelaRevenda.value = cliente.flgBloqueadoPelaRevenda;
    dtaCadastro.value = cliente.dtaCadastro;
    dtaAlteracao.value = cliente.dtaAlteracao;
    dtaContratacao.value = cliente.dtaContratacao;
    dtaCancelamento.value = cliente.dtaCancelamento;
    dtaDesbloqueio.value = cliente.dtaDesbloqueio;
    desRazaoSocialContador.value = cliente.desRazaoSocialContador;
    desEmailContador.value = cliente.desEmailContador;
    valContratacao.value = cliente.valContratacao;
    valFabricante.value = cliente.valFabricante;
    valDistribuidor.value = cliente.valDistribuidor;
    valSubRevenda.value = cliente.valSubRevenda;
    valTerceiros.value = cliente.valTerceiros;
    flgModuloNfse.value = cliente.flgModuloNfse;
    flgModuloVenda.value = cliente.flgModuloVenda;
    flgModuloSATNFCeNFe.value = cliente.flgModuloSATNFCeNFe;
    flgModuloFinanceiro.value = cliente.flgModuloFinanceiro;
    flgModuloCompra.value = cliente.flgModuloCompra;
    flgModuloEstoque.value = cliente.flgModuloEstoque;
    flgModuloBoleto.value = cliente.flgModuloBoleto;
    flgModuloMdfe.value = cliente.flgModuloMdfe;
    flgModuloSped.value = cliente.flgModuloSped;
    flgModuloEcommerce.value = cliente.flgModuloEcommerce;
    flgModuloMidiaIndoor.value = cliente.flgModuloMidiaIndoor;
    flgModuloDelivery.value = cliente.flgModuloDelivery;
    flgModuloMarketing.value = cliente.flgModuloMarketing;
    flgModuloContabilidade.value = cliente.flgModuloContabilidade;
    flgModuloSalao.value = cliente.flgModuloSalao;
    flgModuloClinica.value = cliente.flgModuloClinica;
    flgModuloAgro.value = cliente.flgModuloAgro;
    flgModuloRestaurante.value = cliente.flgModuloRestaurante;
    vencimentoTrial.value = cliente.vencimentoTrial;
    empresaId.value = cliente.empresaId;
    revendaId.value = cliente.revendaId;
    revendaPaiId.value = cliente.revendaPaiId;
    flgRevenda.value = cliente.flgRevenda;
  }

  void updateClient() {
    if (cliente.idLoja != null) {
      clientesController.updateClient(
        cliente.copyWith(
          idLoja: idLoja.value,
          numLoja: numLoja.value,
          tpoRegime: tpoRegime.value,
          desRazaoSocial: desRazaoSocial.value,
          desFantasia: desFantasia.value,
          numCnpj: numCnpj.value,
          numInscEstadual: numInscEstadual.value,
          numInscMunicipal: numInscMunicipal.value,
          desEndereco: desEndereco.value,
          numEndereco: numEndereco.value,
          desBairro: desBairro.value,
          desComplemento: desComplemento.value,
          desObs: desObs.value,
          desMotivoCancelamento: desMotivoCancelamento.value,
          numCep: numCep.value,
          desEmail: desEmail.value,
          tpoRamoAtividade: tpoRamoAtividade.value,
          idConta: idConta.value,
          valJurosFinanceiro: valJurosFinanceiro.value,
          valMultaFinanceiro: valMultaFinanceiro.value,
          empresaDesTipoLicenca: empresaDesTipoLicenca.value,
          cidade: cidade.value,
          numFone: numFone.value,
          numCel: numCel.value,
          valAliqSimples: valAliqSimples.value,
          flgValidarEstoqueVenda: flgValidarEstoqueVenda.value,
          flgInadimplente: flgInadimplente.value,
          flgCancelado: flgCancelado.value,
          flgBloqueado: flgBloqueado.value,
          flgBloqueadoPelaRevenda: flgBloqueadoPelaRevenda.value,
          dtaCadastro: dtaCadastro.value,
          dtaAlteracao: dtaAlteracao.value,
          dtaContratacao: dtaContratacao.value,
          dtaCancelamento: dtaCancelamento.value,
          dtaDesbloqueio: dtaDesbloqueio.value,
          desRazaoSocialContador: desRazaoSocialContador.value,
          desEmailContador: desEmailContador.value,
          valContratacao: valContratacao.value,
          valFabricante: valFabricante.value,
          valDistribuidor: valDistribuidor.value,
          valSubRevenda: valSubRevenda.value,
          valTerceiros: valTerceiros.value,
          flgModuloNfse: flgModuloNfse.value,
          flgModuloVenda: flgModuloVenda.value,
          flgModuloSATNFCeNFe: flgModuloSATNFCeNFe.value,
          flgModuloFinanceiro: flgModuloFinanceiro.value,
          flgModuloCompra: flgModuloCompra.value,
          flgModuloEstoque: flgModuloEstoque.value,
          flgModuloBoleto: flgModuloBoleto.value,
          flgModuloMdfe: flgModuloMdfe.value,
          flgModuloSped: flgModuloSped.value,
          flgModuloEcommerce: flgModuloEcommerce.value,
          flgModuloMidiaIndoor: flgModuloMidiaIndoor.value,
          flgModuloDelivery: flgModuloDelivery.value,
          flgModuloMarketing: flgModuloMarketing.value,
          flgModuloContabilidade: flgModuloContabilidade.value,
          flgModuloSalao: flgModuloSalao.value,
          flgModuloClinica: flgModuloClinica.value,
          flgModuloAgro: flgModuloAgro.value,
          flgModuloRestaurante: flgModuloRestaurante.value,
          vencimentoTrial: vencimentoTrial.value,
          empresaId: empresaId.value,
          revendaId: revendaId.value,
          revendaPaiId: revendaPaiId.value,
          flgRevenda: flgRevenda.value,
        ),
      );
    }
  }
}
