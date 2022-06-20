import 'package:agro_services/src/shared/repositorys/api_controller.dart';

import '../../shared/models/servico_model.dart';

import 'package:flutter/material.dart';

class DetalhesServicoPage extends StatefulWidget {
  final Servico servico;
  const DetalhesServicoPage({super.key, required this.servico});

  @override
  State<DetalhesServicoPage> createState() => _DetalhesServicoPageState();
}

class _DetalhesServicoPageState extends State<DetalhesServicoPage> {
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
                widget.servico.nome,
                style: const TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.servico.imagem, loadingBuilder:
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
                      Text('Descrição -> ${widget.servico.descricao}'),
                      Text('Fornecedor -> ${widget.servico.fornecedor}'),
                      Text('Contato -> ${widget.servico.contato}'),
                      Text('Preço -> ${widget.servico.valor}'),
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
                            apiController.addToCart(servico: widget.servico),
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
