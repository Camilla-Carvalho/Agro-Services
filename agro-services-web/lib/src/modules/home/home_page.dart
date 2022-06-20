import 'package:agro_services/src/shared/repositorys/api_controller.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(viewportFraction: 1);
  final ApiController _homeController = ApiController();

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
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/produtospage'),
              child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 50),
                child: Text('Produtos'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/servicospage'),
              child: const Text('Serviços'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 400),
              child: SizedBox(
                width: 250,
                height: 40,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5, left: 2),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: '',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      Container(
                        height: 50,
                        width: 41,
                        color: Colors.green.shade300,
                        child: Center(
                          child: IconButton(
                            hoverColor: Colors.white,
                            focusColor: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              icon: const Icon(Icons.account_circle_rounded),
            ),
          ),
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/carrinho', arguments: {
              'items': _homeController.numberOfItemsInCart.value,
              'produtos': _homeController.produtosInCart,
              'servicos': _homeController.servicosInCart,
            }),
            icon: const Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: ValueListenableBuilder(
              valueListenable: _homeController.numberOfItemsInCart,
              builder: (BuildContext context, int value, Widget? child) =>
                  _homeController.numberOfItemsInCart.value > 0
                      ? Text('$value')
                      : Container(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                child: GestureDetector(
                  onTap: () {
                    if (_pageController.page == 0) {
                      _pageController.animateToPage(1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutCubicEmphasized);
                    } else if (_pageController.page == 1) {
                      _pageController.animateToPage(2,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutCubicEmphasized);
                    } else if (_pageController.page == 2) {
                      _pageController.animateToPage(0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutCubicEmphasized);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: FutureBuilder(
                      future: _homeController.getCarrosel(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return PageView(
                            controller: _pageController,
                            children: [
                              for (var image in _homeController.carrosel.images)
                                Image.network(
                                  image.url,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? imageChunkEvent) {
                                    if (imageChunkEvent == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: imageChunkEvent
                                                    .expectedTotalBytes !=
                                                null
                                            ? imageChunkEvent
                                                    .cumulativeBytesLoaded /
                                                imageChunkEvent
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                            ],
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Produtos',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FutureBuilder(
                future: _homeController.getAllprodutos(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 150),
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
                            context,
                            '/detalheproduto',
                            arguments: _homeController.produtos[index],
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                  _homeController.produtos[index].imagem,
                                  height: 150, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? imageChunkEvent) {
                                if (imageChunkEvent == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: imageChunkEvent.expectedTotalBytes !=
                                            null
                                        ? imageChunkEvent
                                                .cumulativeBytesLoaded /
                                            imageChunkEvent.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  _homeController.produtos[index].nome,
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
                                            'items': _homeController
                                                .numberOfItemsInCart.value,
                                            'produtos':
                                                _homeController.produtosInCart,
                                            'servicos':
                                                _homeController.servicosInCart,
                                          }),
                                      child: const Center(
                                        child: Text('Comprar'),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _homeController.addToCart(
                                          produto:
                                              _homeController.produtos[index]);
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
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 100),
                child: Text(
                  'Servicos',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FutureBuilder(
                future: _homeController.getAllservicos(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 150),
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
                              arguments: _homeController.servicos[index]),
                          child: Column(
                            children: [
                              Image.network(
                                  _homeController.servicos[index].imagem,
                                  height: 150, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? imageChunkEvent) {
                                if (imageChunkEvent == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: imageChunkEvent.expectedTotalBytes !=
                                            null
                                        ? imageChunkEvent
                                                .cumulativeBytesLoaded /
                                            imageChunkEvent.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  _homeController.servicos[index].nome,
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
                                            'items': _homeController
                                                .numberOfItemsInCart.value,
                                            'produtos':
                                                _homeController.produtosInCart,
                                            'servicos':
                                                _homeController.servicosInCart,
                                          }),
                                      child: const Center(
                                        child: Text('Comprar'),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _homeController.addToCart(
                                          servico:
                                              _homeController.servicos[index]);
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
        ),
      ),
    );
  }
}
