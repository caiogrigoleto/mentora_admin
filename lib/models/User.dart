class UserModel {
  String? id;
  String? name;
  String? email;
  String? imagemProfile;
  bool? theme;
  bool? notificacao;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.imagemProfile = '',
      this.theme,
      this.notificacao});

  // Converte um documento Firestore para uma instância UserModel
  factory UserModel.fromDocument(Map<String, dynamic> doc) {
    return UserModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      imagemProfile: doc['imagemProfile'],
      theme: doc['theme'],
      notificacao: doc['notificacao'],
    );
  }

  // Converte uma instância UserModel para um mapa de dados Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imagemProfile': imagemProfile,
      'theme': theme,
      'notificacao': notificacao
    };
  }
}
