import 'package:flutter/material.dart';

import '../../shared/models/produto_model.dart';
import '../../shared/models/servico_model.dart';
import '../../shared/repositorys/api_controller.dart';

class CarrinhoPage extends StatefulWidget {
  final List<Produto> produtos;
  final List<Servico> servicos;

  const CarrinhoPage(
      {super.key, required this.produtos, required this.servicos});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  final ApiController apiController = ApiController();

  List<int> numberInItemsProdutos = [];
  var mapNumberinIntemsProdutos = {};
  List<int> numberInItemsServicos = [];
  var mapNumberinIntemsServicos = {};
  double valueTotal = 0;
  Map numberServicesStack = {};
  Map numberProdutosStack = {};
  late List<Produto> produtosClean;
  late List<Servico> servicosClean;

  @override
  void initState() {
    produtosClean = widget.produtos.toSet().toList();
    servicosClean = widget.servicos.toSet().toList();

    for (Produto produto in widget.produtos) {
      numberInItemsProdutos.add(produto.id);
      valueTotal += produto.valor;
    }

    for (Servico servico in widget.servicos) {
      numberInItemsServicos.add(servico.id);
      valueTotal += servico.valor;
    }

    for (var element in numberInItemsProdutos) {
      if (!mapNumberinIntemsProdutos.containsKey(element)) {
        mapNumberinIntemsProdutos[element] = 1;
      } else {
        mapNumberinIntemsProdutos[element] += 1;
      }
    }

    for (var element in numberInItemsServicos) {
      if (!mapNumberinIntemsServicos.containsKey(element)) {
        mapNumberinIntemsServicos[element] = 1;
      } else {
        mapNumberinIntemsServicos[element] += 1;
      }

      super.initState();
    }

    List valuesServices = mapNumberinIntemsServicos.values.toList();

    for (int i = 0; i != valuesServices.length; i++) {
      numberServicesStack[i] = valuesServices[i];
    }

    List valuesProdutos = mapNumberinIntemsProdutos.values.toList();

    for (int i = 0; i != valuesProdutos.length; i++) {
      numberProdutosStack[i] = valuesProdutos[i];
    }
  }

  double getValor(int length, double price) => price * length;

  void addProduto(Produto produto, int index) => setState(() {
        numberProdutosStack[index] += 1;
        apiController.addToCart(produto: produto);
        valueTotal += produto.valor;
      });

  void addServico(Servico servico, int index) => setState(() {
        numberServicesStack[index] += 1;
        apiController.addToCart(servico: servico);
        valueTotal += servico.valor;
      });

  void removeProduto(Produto produto, int index) => setState(() {
        if (numberProdutosStack[index] >= 1) {
          numberProdutosStack[index] -= 1;
          apiController.removeToCart(produto: produto);
          valueTotal -= produto.valor;
        }
      });
  void removeSevice(Servico servico, int index) => setState(() {
        if (numberServicesStack[index] >= 1) {
          numberServicesStack[index] -= 1;
          apiController.removeToCart(servico: servico);
          valueTotal -= servico.valor;
        }
      });

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
        ],
      ),
      body: servicosClean.isNotEmpty || produtosClean.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text('Carrinho de compras'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Seus itens adicionados ao carrinho'),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () => apiController
                                      .isLogged()
                                      .then((bool value) {
                                    if (value) {
                                      Navigator.pushReplacementNamed(
                                          context, '/payment');
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    }
                                  }),
                                  child: const Center(
                                    child: Text('Finalizar compra'),
                                  ),
                                ),
                              ),
                            ),
                            Text('Preço total: $valueTotal')
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: numberProdutosStack.length,
                      itemBuilder: (BuildContext context, int index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(produtosClean[index].imagem,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
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
                            padding:
                                const EdgeInsets.only(right: 300, bottom: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Titulo :${produtosClean[index].nome}'),
                                Text(
                                    'Descrição :${produtosClean[index].descricao}'),
                                Text('Peso :${produtosClean[index].peso}'),
                                Text(
                                    'Tamanho :${produtosClean[index].tamanho}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          removeProduto(
                                              produtosClean[index], index);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(
                                        'Quantidade :${numberProdutosStack[index]}'),
                                    IconButton(
                                        onPressed: () {
                                          addProduto(
                                              produtosClean[index], index);
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                Text(
                                    'preço :${getValor(numberProdutosStack[index], produtosClean[index].valor)}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: numberInItemsServicos.length,
                      itemBuilder: (BuildContext context, int index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(servicosClean[index].imagem,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
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
                            padding:
                                const EdgeInsets.only(right: 300, bottom: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nome :${servicosClean[index].nome}'),
                                Text(
                                    'Descrição :${servicosClean[index].descricao}'),
                                Text(
                                    'Fornecedor :${servicosClean[index].fornecedor}'),
                                Text(
                                    'Contato :${servicosClean[index].contato}'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          removeSevice(
                                              servicosClean[index], index);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(
                                        'Quantidade :${numberServicesStack[index]}'),
                                    IconButton(
                                        onPressed: () {
                                          addServico(
                                              servicosClean[index], index);
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                Text(
                                    'preço :${getValor(numberServicesStack[index], servicosClean[index].valor)}'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Text('Seu carrinho está vazio'),
            ),
    );
  }
}
