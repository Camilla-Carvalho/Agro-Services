class Servico {
  final int id;
  final String nome;
  final String descricao;
  final double valor;
  final String imagem;
  final String contato;
  final String fornecedor;

  Servico(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.valor,
      required this.imagem,
      required this.contato,
      required this.fornecedor});

  factory Servico.fromJson(Map<String, dynamic> json) => Servico(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      valor: json['valor'],
      imagem: json['imagem'],
      contato: json['contato'],
      fornecedor: json['fornecedor']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'valor': valor,
        'imagem': imagem,
        'contato': contato,
        'fornecedor': fornecedor,
      };
}
