import 'package:agro_services/src/shared/repositorys/api_repository.dart';
import 'package:agro_services/src/shared/services/service_web_request_http.dart';
import 'package:flutter/material.dart';

import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final CadastroController _cadastroController = CadastroController(
    ApiRepository(
      ServiceWebHttp(),
    ),
  );

  @override
  void dispose() {
    _cadastroController.dispose();
    super.dispose();
  }

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
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 50),
                child: Text('Produtos'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text('Serviços'),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 75, left: 300, right: 300, bottom: 25),
        color: Colors.grey.shade200,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green.shade200, width: 1.0),
          ),
          child: Form(
            key: _cadastroController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: SizedBox(
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                } else {
                                  return null;
                                }
                              },
                              controller:
                                  _cadastroController.textEditingControllerName,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          controller:
                              _cadastroController.textEditingControllerLastName,
                          decoration: const InputDecoration(
                            labelText: 'Sobrenome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          controller:
                              _cadastroController.textEditingControllerAddress,
                          decoration: const InputDecoration(
                            labelText: 'Endereço',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                try {
                                  DateTime.parse(value);
                                } catch (e) {
                                  debugPrint('erro');
                                }
                                return null;
                              }
                            },
                            controller: _cadastroController
                                .textEditingControllerdateOfBirth,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              labelText: 'Data de nascimento',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                return null;
                              }
                            },
                            controller:
                                _cadastroController.textEditingControllerCpf,
                            decoration: const InputDecoration(
                              labelText: 'Cpf',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          controller:
                              _cadastroController.textEditingControllerPhone,
                          decoration: const InputDecoration(
                            labelText: 'Tel',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            obscureText: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 8) {
                                return 'Please at least 8 characters';
                              } else {
                                return null;
                              }
                            },
                            controller: _cadastroController
                                .textEditingControllerPassword1,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length < 8) {
                              return 'Please at least 8 characters';
                            } else {
                              return null;
                            }
                          },
                          controller: _cadastroController
                              .textEditingControllerPassword2,
                          decoration: const InputDecoration(
                            labelText: 'Confirme a senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () => _cadastroController.cadastro(context),
                  child: const SizedBox(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text('Criar conta'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
