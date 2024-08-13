class LeadsModel {
  String? id;
  String? userId;
  String? nomeFantasia;
  String? nomeContato;
  String? celularContato;
  String? emailContato;
  String? sistema;
  String? valor;
  int? satisfeito;
  String? escritorio;
  DateTime? dataCriacao;

  LeadsModel(
      {this.id,
      this.userId,
      this.nomeFantasia,
      this.nomeContato,
      this.celularContato,
      this.emailContato,
      this.sistema,
      this.valor,
      this.satisfeito,
      this.escritorio,
      this.dataCriacao});

  factory LeadsModel.fromDocument(Map<String, dynamic> doc) {
    return LeadsModel(
      id: doc['id'],
      userId: doc['userId'],
      nomeFantasia: doc['nomeFantasia'],
      nomeContato: doc['nomeContato'],
      celularContato: doc['celularContato'],
      emailContato: doc['emailContato'],
      dataCriacao: doc['dataCriacao'],
    );
  }
}
