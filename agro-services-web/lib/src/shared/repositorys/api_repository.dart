import 'dart:convert';
import 'dart:math';

import 'package:agro_services/src/shared/mock/api_mock.dart';
import 'package:agro_services/src/shared/mock/users.dart';
import 'package:agro_services/src/shared/models/carrosel_model.dart';
import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:agro_services/src/shared/models/usuario_model.dart';

import '../models/servico_model.dart';
import '../services/interfaces/service_web_request_interface.dart';
import 'interfaces/api_interface.dart';

class ApiRepository implements ApiInterface {
  @override
  final ServiceWebRequestInterface serviceWebRequestInterface;

  ApiRepository(this.serviceWebRequestInterface);

  static bool auth = false;

  @override
  Future<List<Produto>> getProducts() async {
    /* final ServiceWebResponseInterface respose = await serviceWebRequestInterface
        .get('http://localhost:8080/api/produto/', headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
    });
*/

    // final json = jsonDecode(respose.body) as Map<String, dynamic>;

    final String jsonRaw = ApiMock().jsonGetProdutos();
    final jsonAll = jsonDecode(jsonRaw) as List;
    final List<Produto> listaDeProdutos = [];
    for (int i = 0; i != jsonAll.length; i++) {
      listaDeProdutos.add(Produto.fromJson(jsonAll[i]));
    }

    return listaDeProdutos;
  }

  @override
  Future<List<Servico>> getServices() async {
    final String jsonRaw = ApiMock().jsonGetServicos();
    final jsonAll = jsonDecode(jsonRaw) as List;
    final List<Servico> listaDeServicos = [];
    for (int i = 0; i != jsonAll.length; i++) {
      listaDeServicos.add(Servico.fromJson(jsonAll[i]));
    }

    return listaDeServicos;
  }

  @override
  Future<Carrosel> getCarrosel() async {
    final String jsonRaw = ApiMock().jsonGetCarrosel();
    final json = jsonDecode(jsonRaw);
    final Carrosel carrosel = Carrosel.fromJson(json);
    return carrosel;
  }

  @override
  Future<bool> isLogged() => Future.delayed(Duration.zero, () => auth);

  @override
  void login(String email, String senha) {
    for (var element in Users().usuarios) {
      if (email == element.email && senha == element.senha) {
        auth = true;
      }
    }
  }

  @override
  void cadastro(String nome, String lastName, String password, String email,
      String cpf, String adress, String phone, String dataNascimento) {
    Users().usuarios.add(
          Usuario(
              id: Random().nextInt(100),
              nome: nome,
              cpf: cpf,
              dataNascimento: dataNascimento,
              email: email,
              senha: password,
              telefone: phone,
              endereco: adress,
              isAdmin: false),
        );
  }
}
