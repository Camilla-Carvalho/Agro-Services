import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:flutter/material.dart';

import '../../shared/repositorys/api_controller.dart';

class DetalhesProdutoPage extends StatefulWidget {
  final Produto produto;
  const DetalhesProdutoPage({super.key, required this.produto});

  @override
  State<DetalhesProdutoPage> createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState extends State<DetalhesProdutoPage> {
  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Agro Services'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/carrinho', arguments: {
              'items': apiController.numberOfItemsInCart.value,
              'produtos': apiController.produtosInCart,
              'servicos': apiController.servicosInCart,
            }),
            icon: const Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: ValueListenableBuilder(
              valueListenable: apiController.numberOfItemsInCart,
              builder: (BuildContext context, int value, Widget? child) =>
                  apiController.numberOfItemsInCart.value > 0
                      ? Text('$value')
                      : Container(),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                widget.produto.nome,
                style: const TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.produto.imagem, loadingBuilder:
                    (BuildContext context, Widget child,
                        ImageChunkEvent? imageChunkEvent) {
                  if (imageChunkEvent == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: imageChunkEvent.expectedTotalBytes != null
                          ? imageChunkEvent.cumulativeBytesLoaded /
                              imageChunkEvent.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Descrição -> ${widget.produto.descricao}'),
                      Text('Peso -> ${widget.produto.peso}'),
                      Text('Tamanho -> ${widget.produto.tamanho}'),
                      Text('Preço -> ${widget.produto.valor}'),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () =>
                            apiController.addToCart(produto: widget.produto),
                        child: const Center(
                          child: Text('Adicionar ao carinho'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, '/carrinho',
                            arguments: {
                              'items': apiController.numberOfItemsInCart.value,
                              'produtos': apiController.produtosInCart,
                              'servicos': apiController.servicosInCart,
                            }),
                        child: const Center(
                          child: Text('Comprar'),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
