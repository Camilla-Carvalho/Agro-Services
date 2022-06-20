class Usuario {
  final int id;
  final String nome;
  final String cpf;
  final String dataNascimento;
  final String email;
  final String senha;
  final String telefone;
  final String endereco;
  final bool isAdmin;

  Usuario(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.dataNascimento,
      required this.email,
      required this.senha,
      required this.telefone,
      required this.endereco,
      required this.isAdmin});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      dataNascimento: json['dataNascimento'],
      email: json['email'],
      senha: json['senha'],
      telefone: json['telefone'],
      endereco: json['endereco'],
      isAdmin: json['isAdmin']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'cpf': cpf,
        'dataNascimento': dataNascimento,
        'email': email,
        'senha': senha,
        'telefone': telefone,
        'endereco': endereco,
        'isAdmin': isAdmin,
      };
}
