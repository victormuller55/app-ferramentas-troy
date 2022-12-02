class UsuarioModel {
  int? id;
  String? nome;
  String? username;
  String? email;
  String? senha;

  UsuarioModel({
    this.id,
    this.nome,
    this.username,
    this.email,
    this.senha,
  });

  factory UsuarioModel.empty() {
    return UsuarioModel(
      id: 0,
      nome: '',
      username: '',
      email: '',
      senha: '',
    );
  }

  UsuarioModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    username = json['username'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'nome': nome,
        'email': email,
        'senha': senha,
      };
}
