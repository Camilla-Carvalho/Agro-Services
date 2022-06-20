import 'package:agro_services/src/modules/payment/payment_page.dart';
import 'package:flutter/material.dart';

import '../../modules/all_produtos/produtos_page.dart';
import '../../modules/all_servicos/servicos_page.dart';
import '../../modules/cadastro/cadastro_page.dart';
import '../../modules/carrinho/carrinho_page.dart';
import '../../modules/detalhe_produto/detalhes_produto_page.dart';
import '../../modules/detalhes_servicos/detalhes_servicos_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/login/login_page.dart';
import '../models/produto_model.dart';
import '../models/servico_model.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    if (settings.name == '/home') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const MyHomePage(),
      );
    } else if (settings.name == '/login') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      );
    } else if (settings.name == '/cadastro') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const CadastroPage(),
      );
    } else if (settings.name == '/carrinho') {
      final Map arguments = settings.arguments as Map;

      return MaterialPageRoute(
        builder: (BuildContext context) => CarrinhoPage(
          produtos: arguments['produtos'],
          servicos: arguments['servicos'],
        ),
      );
    } else if (settings.name == '/detalheproduto') {
      return MaterialPageRoute(
        builder: (BuildContext context) => DetalhesProdutoPage(
          produto: settings.arguments as Produto,
        ),
      );
    } else if (settings.name == '/detalhesservico') {
      return MaterialPageRoute(
        builder: (BuildContext context) => DetalhesServicoPage(
          servico: settings.arguments as Servico,
        ),
      );
    } else if (settings.name == '/produtospage') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const ProdutosPage(),
      );
    } else if (settings.name == '/servicospage') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const ServicosPage(),
      );
    } else if (settings.name == '/payment') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const PaymentPage(),
      );
    } else {
      return null;
    }
  }
}
