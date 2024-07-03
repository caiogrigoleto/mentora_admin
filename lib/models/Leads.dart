class LeadsModel {
  String? id;
  String? nomeFantasia;
  String? nomeContato;
  String? celularContato;
  String? emailContato;
  DateTime? dataCriacao;

  LeadsModel(
      {this.id,
      this.nomeFantasia,
      this.nomeContato,
      this.celularContato,
      this.emailContato,
      this.dataCriacao});

  factory LeadsModel.fromDocument(Map<String, dynamic> doc) {
    return LeadsModel(
      id: doc['id'],
      nomeFantasia: doc['nomeFantasia'],
      nomeContato: doc['nomeContato'],
      celularContato: doc['celularContato'],
      emailContato: doc['emailContato'],
      dataCriacao: doc['dataCriacao'],
    );
  }
}
