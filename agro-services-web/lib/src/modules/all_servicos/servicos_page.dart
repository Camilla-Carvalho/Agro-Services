import 'package:agro_services/src/shared/repositorys/api_controller.dart';
import 'package:flutter/material.dart';

class ServicosPage extends StatefulWidget {
  const ServicosPage({super.key});

  @override
  State<ServicosPage> createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 150, top: 100),
              child: Text(
                'Serviços',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          FutureBuilder(
            future: apiController.getAllservicos(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 150, right: 150, top: 100),
                  child: GridView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, '/detalhesservico',
                          arguments: apiController.servicos[index]),
                      child: Column(
                        children: [
                          Image.network(apiController.servicos[index].imagem,
                              height: 150, loadingBuilder:
                                  (BuildContext context, Widget child,
                                      ImageChunkEvent? imageChunkEvent) {
                            if (imageChunkEvent == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: imageChunkEvent.expectedTotalBytes !=
                                        null
                                    ? imageChunkEvent.cumulativeBytesLoaded /
                                        imageChunkEvent.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              apiController.servicos[index].nome,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/carrinho',
                                      arguments: {
                                        'items': apiController
                                            .numberOfItemsInCart.value,
                                        'produtos':
                                            apiController.produtosInCart,
                                        'servicos':
                                            apiController.servicosInCart,
                                      }),
                                  child: const Center(
                                    child: Text('Comprar'),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  apiController.addToCart(
                                      servico: apiController.servicos[index]);
                                },
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
