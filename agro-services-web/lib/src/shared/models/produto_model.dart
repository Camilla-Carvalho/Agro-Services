class Produto {
  final int id;
  final String nome;
  final String peso;
  final String imagem;
  final double valor;
  final String descricao;
  final String tamanho;

  Produto(
      {required this.id,
      required this.nome,
      required this.peso,
      required this.imagem,
      required this.valor,
      required this.descricao,
      required this.tamanho});

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        id: json['id'],
        nome: json['nome'],
        peso: json['peso'],
        imagem: json['imagem'],
        valor: json['valor'],
        descricao: json['descricao'],
        tamanho: json['tamanho'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'peso': peso,
        'imagem': imagem,
        'valor': valor,
        'descricao': descricao,
        'tamanho': tamanho,
      };
}
