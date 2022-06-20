import 'package:agro_services/src/shared/repositorys/api_repository.dart';
import 'package:flutter/material.dart';

import '../../shared/repositorys/interfaces/api_interface.dart';

class LoginController {
  final ApiInterface apiRepository;

  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginController(this.apiRepository);

  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      apiRepository.login(
          textEditingControllerEmail.text, textEditingControllerPassword.text);
      if (ApiRepository.auth) {
        Navigator.pushNamed(context, '/home');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(
                const Duration(seconds: 2), () => Navigator.pop(context));
            return const AlertDialog(
              content: Text('Login incorreto'),
            );
          },
        );
      }
    }
  }
}
