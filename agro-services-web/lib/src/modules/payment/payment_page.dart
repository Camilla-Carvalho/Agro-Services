import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController contry = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController adress = TextEditingController();
  final TextEditingController cep = TextEditingController();

  @override
  void dispose() {
    contry.dispose();
    city.dispose();
    state.dispose();
    cep.dispose();
    adress.dispose();
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
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(
              top: 60, left: 480, right: 480, bottom: 190),
          color: Colors.grey.shade200,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green.shade200, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Pais",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 5,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: "Estado",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: "Cidade",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: "Cep",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Endereço",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 10, left: 100, right: 100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AlertDialog(
                              title: Text('Enviamos seu boleto no email :)'),
                            ),
                          );
                          Future.delayed(
                            const Duration(seconds: 2),
                            () => Navigator.pushReplacementNamed(
                                context, '/home'),
                          );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text('Finalizar compra'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
