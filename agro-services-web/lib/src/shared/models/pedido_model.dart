import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:agro_services/src/shared/models/servico_model.dart';

class Pedido {
  final int id;
  final double total;
  final String idUsuario;
  final List<Servico>? servicos;
  final List<Produto>? produtos;
  final String formaPagamento;
  final String dataEntrega;

  Pedido(
      {required this.id,
      required this.total,
      required this.idUsuario,
      required this.servicos,
      required this.produtos,
      required this.formaPagamento,
      required this.dataEntrega});

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json['id'],
        total: json['total'],
        idUsuario: json['idUsuario'],
        formaPagamento: json['formaPagamento'],
        dataEntrega: json['dataEntrega'],
        produtos: (json['produtos'] as List)
            .map((produto) => Produto.fromJson(produto))
            .toList(),
        servicos: (json['produtos'] as List)
            .map((produto) => Servico.fromJson(produto))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'idUsuario': idUsuario,
        'servicos': servicos!.map((servico) => servico.toJson()).toList(),
        'produtos': produtos!.map((produto) => produto.toJson()).toList(),
        'formaPagamento': formaPagamento,
        'dataEntrega': dataEntrega,
      };
}
