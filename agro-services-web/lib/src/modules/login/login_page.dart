import 'package:flutter/material.dart';

import '../../shared/repositorys/api_repository.dart';
import '../../shared/services/service_web_request_http.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController(
    ApiRepository(
      ServiceWebHttp(),
    ),
  );

  @override
  void dispose() {
    _loginController.dispose();
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
      body: Form(
        key: _loginController.formKey,
        child: Container(
          padding: const EdgeInsets.only(
              top: 60, left: 480, right: 480, bottom: 120),
          color: Colors.grey.shade200,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green.shade200, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset("assets/logo.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    controller: _loginController.textEditingControllerEmail,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
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
                      controller:
                          _loginController.textEditingControllerPassword,
                      decoration: const InputDecoration(
                        labelText: "Senha",
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
                      onPressed: () => _loginController.login(context),
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text('Login'),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                    child: const Text(
                        'Não possui cadastro? Acesse para cadastrar.'),
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
