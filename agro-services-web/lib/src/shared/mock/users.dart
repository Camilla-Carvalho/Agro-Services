import '../models/usuario_model.dart';

class Users {
  static final Users _users = Users._();

  Users._();

  factory Users() => _users;

  List<Usuario> usuarios = [
    Usuario(
        id: 0,
        nome: 'vinicius',
        cpf: '12345678',
        dataNascimento: '2345664',
        email: 'viniciusddrft5@gmail.com',
        senha: '12345678',
        telefone: '12345678',
        endereco: 'rizzieri',
        isAdmin: false),
  ];
}
