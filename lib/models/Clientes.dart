class ClientesModel {
  int? idLoja;
  int? numLoja;
  int? tpoRegime;
  String? desRazaoSocial;
  String? desFantasia;
  String? numCnpj;
  String? numInscEstadual;
  String? numInscMunicipal;
  String? desEndereco;
  String? numEndereco;
  String? desBairro;
  String? desComplemento;
  String? desObs;
  String? desMotivoCancelamento;
  String? numCep;
  String? desEmail;
  int? tpoRamoAtividade;
  int? idConta;
  double? valJurosFinanceiro;
  double? valMultaFinanceiro;
  String? empresaDesTipoLicenca;
  String? cidade;
  String? numFone;
  String? numCel;
  double? valAliqSimples;
  bool? flgValidarEstoqueVenda;
  bool? flgInadimplente;
  bool? flgCancelado;
  bool? flgBloqueado;
  bool? flgBloqueadoPelaRevenda;
  String? dtaCadastro;
  String? dtaAlteracao;
  String? dtaContratacao;
  String? dtaCancelamento;
  String? dtaDesbloqueio;
  String? desRazaoSocialContador;
  String? desEmailContador;
  double? valContratacao;
  double? valFabricante;
  double? valDistribuidor;
  double? valSubRevenda;
  double? valTerceiros;
  bool? flgModuloNfse;
  bool? flgModuloVenda;
  bool? flgModuloSATNFCeNFe;
  bool? flgModuloFinanceiro;
  bool? flgModuloCompra;
  bool? flgModuloEstoque;
  bool? flgModuloBoleto;
  bool? flgModuloMdfe;
  bool? flgModuloSped;
  bool? flgModuloEcommerce;
  bool? flgModuloMidiaIndoor;
  bool? flgModuloDelivery;
  bool? flgModuloMarketing;
  bool? flgModuloContabilidade;
  bool? flgModuloSalao;
  bool? flgModuloClinica;
  bool? flgModuloAgro;
  bool? flgModuloRestaurante;
  String? vencimentoTrial;
  int? empresaId;
  String? revendaId;
  String? revendaPaiId;
  bool? flgRevenda;

  ClientesModel({
    this.idLoja,
    this.numLoja,
    this.tpoRegime,
    this.desRazaoSocial,
    this.desFantasia,
    this.numCnpj,
    this.numInscEstadual,
    this.numInscMunicipal,
    this.desEndereco,
    this.numEndereco,
    this.desBairro,
    this.desComplemento,
    this.desObs,
    this.desMotivoCancelamento,
    this.numCep,
    this.desEmail,
    this.tpoRamoAtividade,
    this.idConta,
    this.valJurosFinanceiro,
    this.valMultaFinanceiro,
    this.empresaDesTipoLicenca,
    this.cidade,
    this.numFone,
    this.numCel,
    this.valAliqSimples,
    this.flgValidarEstoqueVenda,
    this.flgInadimplente,
    this.flgCancelado,
    this.flgBloqueado,
    this.flgBloqueadoPelaRevenda,
    this.dtaCadastro,
    this.dtaAlteracao,
    this.dtaContratacao,
    this.dtaCancelamento,
    this.dtaDesbloqueio,
    this.desRazaoSocialContador,
    this.desEmailContador,
    this.valContratacao,
    this.valFabricante,
    this.valDistribuidor,
    this.valSubRevenda,
    this.valTerceiros,
    this.flgModuloNfse,
    this.flgModuloVenda,
    this.flgModuloSATNFCeNFe,
    this.flgModuloFinanceiro,
    this.flgModuloCompra,
    this.flgModuloEstoque,
    this.flgModuloBoleto,
    this.flgModuloMdfe,
    this.flgModuloSped,
    this.flgModuloEcommerce,
    this.flgModuloMidiaIndoor,
    this.flgModuloDelivery,
    this.flgModuloMarketing,
    this.flgModuloContabilidade,
    this.flgModuloSalao,
    this.flgModuloClinica,
    this.flgModuloAgro,
    this.flgModuloRestaurante,
    this.vencimentoTrial,
    this.empresaId,
    this.revendaId,
    this.revendaPaiId,
    this.flgRevenda,
  });

  ClientesModel.fromJson(Map<String, dynamic> json) {
    idLoja = json['idLoja'];
    numLoja = json['numLoja'];
    tpoRegime = json['tpoRegime'];
    desRazaoSocial = json['desRazaoSocial'];
    desFantasia = json['desFantasia'];
    numCnpj = json['numCnpj'];
    numInscEstadual = json['numInscEstadual'];
    numInscMunicipal = json['numInscMunicipal'];
    desEndereco = json['desEndereco'];
    numEndereco = json['numEndereco'];
    desBairro = json['desBairro'];
    desComplemento = json['desComplemento'];
    desObs = json['desObs'];
    desMotivoCancelamento = json['desMotivoCancelamento'];
    numCep = json['numCep'];
    desEmail = json['desEmail'];
    tpoRamoAtividade = json['tpoRamoAtividade'];
    idConta = json['idConta'];
    valJurosFinanceiro = json['valJurosFinanceiro'];
    valMultaFinanceiro = json['valMultaFinanceiro'];
    empresaDesTipoLicenca = json['empresaDesTipoLicenca'];
    cidade = json['cidade'];
    numFone = json['numFone'];
    numCel = json['numCel'];
    valAliqSimples = json['valAliqSimples'];
    flgValidarEstoqueVenda = json['flgValidarEstoqueVenda'];
    flgInadimplente = json['flgInadimplente'];
    flgCancelado = json['flgCancelado'];
    flgBloqueado = json['flgBloqueado'];
    flgBloqueadoPelaRevenda = json['flgBloqueadoPelaRevenda'];
    dtaCadastro = json['dtaCadastro'];
    dtaAlteracao = json['dtaAlteracao'];
    dtaContratacao = json['dtaContratacao'];
    dtaCancelamento = json['dtaCancelamento'];
    dtaDesbloqueio = json['dtaDesbloqueio'];
    desRazaoSocialContador = json['desRazaoSocialContador'];
    desEmailContador = json['desEmailContador'];
    valContratacao = 0.0; //double.parse(json['valContratacao']);
    valDistribuidor = 0.0; //double.parse(json['valDistribuidor']);
    valSubRevenda = 0.0; //double.parse(json['valSubRevenda']);
    valTerceiros = 0.0; //double.parse(json['valTerceiros']);
    flgModuloNfse = json['flgModuloNfse'];
    flgModuloVenda = json['flgModuloVenda'];
    flgModuloSATNFCeNFe = json['flgModuloSATNFCeNFe'];
    flgModuloFinanceiro = json['flgModuloFinanceiro'];
    flgModuloCompra = json['flgModuloCompra'];
    flgModuloEstoque = json['flgModuloEstoque'];
    flgModuloBoleto = json['flgModuloBoleto'];
    flgModuloMdfe = json['flgModuloMdfe'];
    flgModuloSped = json['flgModuloSped'];
    flgModuloEcommerce = json['flgModuloEcommerce'];
    flgModuloMidiaIndoor = json['flgModuloMidiaIndoor'];
    flgModuloDelivery = json['flgModuloDelivery'];
    flgModuloMarketing = json['flgModuloMarketing'];
    flgModuloContabilidade = json['flgModuloContabilidade'];
    flgModuloSalao = json['flgModuloSalao'];
    flgModuloClinica = json['flgModuloClinica'];
    flgModuloAgro = json['flgModuloAgro'];
    flgModuloRestaurante = json['flgModuloRestaurante'];
    vencimentoTrial = json['vencimentoTrial'];
    empresaId = json['empresaId'];
    revendaId = json['revendaId'];
    revendaPaiId = json['revendaPaiId'];
    flgRevenda = json['flgRevenda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLoja'] = idLoja;
    data['numLoja'] = numLoja;
    data['tpoRegime'] = tpoRegime;
    data['desRazaoSocial'] = desRazaoSocial;
    data['desFantasia'] = desFantasia;
    data['numCnpj'] = numCnpj;
    data['numInscEstadual'] = numInscEstadual;
    data['numInscMunicipal'] = numInscMunicipal;
    data['desEndereco'] = desEndereco;
    data['numEndereco'] = numEndereco;
    data['desBairro'] = desBairro;
    data['desComplemento'] = desComplemento;
    data['desObs'] = desObs;
    data['numCep'] = numCep;
    data['desEmail'] = desEmail;
    data['cidade'] = cidade;
    data['numFone'] = numFone;
    data['numCel'] = numCel;
    data['flgBloqueado'] = flgBloqueado;
    data['flgInadimplente'] = flgInadimplente;
    data['flgCancelado'] = flgCancelado;
    data['flgBloqueadoPelaRevenda'] = flgBloqueadoPelaRevenda;
    data['dtaContratacao'] = dtaContratacao;
    data['dtaCadastro'] = dtaCadastro;
    data['dtaDesbloqueio'] = dtaDesbloqueio;
    data['desEmailContador'] = desEmailContador;
    data['desRazaoSocialContador'] = desRazaoSocialContador;
    data['valContratacao'] = valContratacao;
    data['valDistribuidor'] = valDistribuidor;
    data['valSubRevenda'] = valSubRevenda;
    data['valTerceiros'] = valTerceiros;
    data['flgModuloNfse'] = flgModuloNfse;
    data['flgModuloVenda'] = flgModuloVenda;
    data['flgModuloSATNFCeNFe'] = flgModuloSATNFCeNFe;
    data['flgModuloFinanceiro'] = flgModuloFinanceiro;
    data['flgModuloCompra'] = flgModuloCompra;
    data['flgModuloEstoque'] = flgModuloEstoque;
    data['flgModuloBoleto'] = flgModuloBoleto;
    data['flgModuloMdfe'] = flgModuloMdfe;
    data['flgModuloSped'] = flgModuloSped;
    data['flgModuloEcommerce'] = flgModuloEcommerce;
    data['flgModuloMidiaIndoor'] = flgModuloMidiaIndoor;
    data['flgModuloDelivery'] = flgModuloDelivery;
    data['flgModuloMarketing'] = flgModuloMarketing;
    data['flgModuloContabilidade'] = flgModuloContabilidade;
    data['flgModuloSalao'] = flgModuloSalao;
    data['flgModuloClinica'] = flgModuloClinica;
    data['flgModuloAgro'] = flgModuloAgro;
    data['flgModuloRestaurante'] = flgModuloRestaurante;
    data['vencimentoTrial'] = vencimentoTrial;
    data['empresaId'] = empresaId;
    data['revendaId'] = revendaId;
    data['revendaPaiId'] = revendaPaiId;
    data['flgRevenda'] = flgRevenda;
    return data;
  }

  ClientesModel copyWith(
      {int? idLoja,
      int? numLoja,
      int? tpoRegime,
      String? desRazaoSocial,
      String? desFantasia,
      String? numCnpj,
      String? numInscEstadual,
      String? numInscMunicipal,
      String? desEndereco,
      String? numEndereco,
      String? desBairro,
      String? desComplemento,
      String? desObs,
      String? desMotivoCancelamento,
      String? numCep,
      String? desEmail,
      int? tpoRamoAtividade,
      int? idConta,
      double? valJurosFinanceiro,
      double? valMultaFinanceiro,
      String? empresaDesTipoLicenca,
      String? cidade,
      String? numFone,
      String? numCel,
      double? valAliqSimples,
      bool? flgValidarEstoqueVenda,
      bool? flgInadimplente,
      bool? flgCancelado,
      bool? flgBloqueado,
      bool? flgBloqueadoPelaRevenda,
      String? dtaCadastro,
      String? dtaAlteracao,
      String? dtaContratacao,
      String? dtaCancelamento,
      String? dtaDesbloqueio,
      String? desRazaoSocialContador,
      String? desEmailContador,
      double? valContratacao,
      double? valFabricante,
      double? valDistribuidor,
      double? valSubRevenda,
      double? valTerceiros,
      bool? flgModuloNfse,
      bool? flgModuloVenda,
      bool? flgModuloSATNFCeNFe,
      bool? flgModuloFinanceiro,
      bool? flgModuloCompra,
      bool? flgModuloEstoque,
      bool? flgModuloBoleto,
      bool? flgModuloMdfe,
      bool? flgModuloSped,
      bool? flgModuloEcommerce,
      bool? flgModuloMidiaIndoor,
      bool? flgModuloDelivery,
      bool? flgModuloMarketing,
      bool? flgModuloContabilidade,
      bool? flgModuloSalao,
      bool? flgModuloClinica,
      bool? flgModuloAgro,
      bool? flgModuloRestaurante,
      String? vencimentoTrial,
      int? empresaId,
      String? revendaId,
      String? revendaPaiId,
      bool? flgRevenda}) {
    return ClientesModel(
      idLoja: idLoja ?? this.idLoja,
      numLoja: numLoja ?? this.numLoja,
      tpoRegime: tpoRegime ?? this.tpoRegime,
      desRazaoSocial: desRazaoSocial ?? this.desRazaoSocial,
      desFantasia: desFantasia ?? this.desFantasia,
      numCnpj: numCnpj ?? this.numCnpj,
      numInscEstadual: numInscEstadual ?? this.numInscEstadual,
      numInscMunicipal: numInscMunicipal ?? this.numInscMunicipal,
      desEndereco: desEndereco ?? this.desEndereco,
      numEndereco: numEndereco ?? this.numEndereco,
      desBairro: desBairro ?? this.desBairro,
      desComplemento: desComplemento ?? this.desComplemento,
      desObs: desObs ?? this.desObs,
      desMotivoCancelamento:
          desMotivoCancelamento ?? this.desMotivoCancelamento,
      numCep: numCep ?? this.numCep,
      desEmail: desEmail ?? this.desEmail,
      tpoRamoAtividade: tpoRamoAtividade ?? this.tpoRamoAtividade,
      idConta: idConta ?? this.idConta,
      valJurosFinanceiro: valJurosFinanceiro ?? this.valJurosFinanceiro,
      valMultaFinanceiro: valMultaFinanceiro ?? this.valMultaFinanceiro,
      empresaDesTipoLicenca:
          empresaDesTipoLicenca ?? this.empresaDesTipoLicenca,
      cidade: cidade ?? this.cidade,
      numFone: numFone ?? this.numFone,
      numCel: numCel ?? this.numCel,
      valAliqSimples: valAliqSimples ?? this.valAliqSimples,
      flgValidarEstoqueVenda:
          flgValidarEstoqueVenda ?? this.flgValidarEstoqueVenda,
      flgInadimplente: flgInadimplente ?? this.flgInadimplente,
      flgCancelado: flgCancelado ?? this.flgCancelado,
      flgBloqueado: flgBloqueado ?? this.flgBloqueado,
      flgBloqueadoPelaRevenda:
          flgBloqueadoPelaRevenda ?? this.flgBloqueadoPelaRevenda,
      dtaCadastro: dtaCadastro ?? this.dtaCadastro,
      dtaAlteracao: dtaAlteracao ?? this.dtaAlteracao,
      dtaContratacao: dtaContratacao ?? this.dtaContratacao,
      dtaCancelamento: dtaCancelamento ?? this.dtaCancelamento,
      dtaDesbloqueio: dtaDesbloqueio ?? this.dtaDesbloqueio,
      valContratacao: valContratacao ?? this.valContratacao,
      desRazaoSocialContador:
          desRazaoSocialContador ?? this.desRazaoSocialContador,
      desEmailContador: desEmailContador ?? this.desEmailContador,
      valFabricante: valFabricante ?? this.valFabricante,
      valDistribuidor: valDistribuidor ?? this.valDistribuidor,
      valSubRevenda: valSubRevenda ?? this.valSubRevenda,
      valTerceiros: valTerceiros ?? this.valTerceiros,
      flgModuloNfse: flgModuloNfse ?? this.flgModuloNfse,
      flgModuloVenda: flgModuloVenda ?? this.flgModuloVenda,
      flgModuloSATNFCeNFe: flgModuloSATNFCeNFe ?? this.flgModuloSATNFCeNFe,
      flgModuloFinanceiro: flgModuloFinanceiro ?? this.flgModuloFinanceiro,
      flgModuloCompra: flgModuloCompra ?? this.flgModuloCompra,
      flgModuloEstoque: flgModuloEstoque ?? this.flgModuloEstoque,
      flgModuloBoleto: flgModuloBoleto ?? this.flgModuloBoleto,
      flgModuloMdfe: flgModuloMdfe ?? this.flgModuloMdfe,
      flgModuloSped: flgModuloSped ?? this.flgModuloSped,
      flgModuloEcommerce: flgModuloEcommerce ?? this.flgModuloEcommerce,
      flgModuloMidiaIndoor: flgModuloMidiaIndoor ?? this.flgModuloMidiaIndoor,
      flgModuloDelivery: flgModuloDelivery ?? this.flgModuloDelivery,
      flgModuloMarketing: flgModuloMarketing ?? this.flgModuloMarketing,
      flgModuloContabilidade:
          flgModuloContabilidade ?? this.flgModuloContabilidade,
      flgModuloSalao: flgModuloSalao ?? this.flgModuloSalao,
      flgModuloClinica: flgModuloClinica ?? this.flgModuloClinica,
      flgModuloAgro: flgModuloAgro ?? this.flgModuloAgro,
      flgModuloRestaurante: flgModuloRestaurante ?? this.flgModuloRestaurante,
      vencimentoTrial: vencimentoTrial ?? this.vencimentoTrial,
      empresaId: empresaId ?? this.empresaId,
      revendaId: revendaId ?? this.revendaId,
      revendaPaiId: revendaPaiId ?? this.revendaPaiId,
      flgRevenda: flgRevenda ?? this.flgRevenda,
    );
  }
}
