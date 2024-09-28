class LeadsModel {
  String? id;
  String? userId;
  String? nomeFantasia;
  String? nomeContato;
  String? celularContato;
  String? sistema;
  String? valor;
  int? satisfeito;
  int? suporte;
  int? atendimento;
  String? escritorio;
  String? observacao;

  DateTime? dataVoltaAtendimento;
  DateTime? dataCriacao;

  LeadsModel(
      {this.id,
      this.userId,
      this.nomeFantasia,
      this.nomeContato,
      this.celularContato,
      this.sistema,
      this.valor,
      this.satisfeito,
      this.escritorio,
      this.observacao,
      this.dataVoltaAtendimento,
      this.atendimento,
      this.suporte,
      this.dataCriacao});

  factory LeadsModel.fromDocument(Map<String, dynamic> doc) {
    return LeadsModel(
      id: doc['id'],
      userId: doc['userId'],
      nomeFantasia: doc['nomeFantasia'],
      nomeContato: doc['nomeContato'],
      celularContato: doc['celularContato'],
      dataCriacao: doc['dataCriacao'],
      sistema: doc['sistema'],
      valor: doc['valor'],
      satisfeito: doc['satisfeito'],
      escritorio: doc['escritorio'],
      observacao: doc['observacao'],
      dataVoltaAtendimento: doc['dataVoltaAtendimento'],
      atendimento: doc['atendimento'],
      suporte: doc['suporte'],
    );
  }
}
