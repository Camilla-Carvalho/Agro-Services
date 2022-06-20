import 'package:flutter/material.dart';

import '../../shared/repositorys/interfaces/api_interface.dart';

class CadastroController {
  final ApiInterface apiRepository;

  final TextEditingController textEditingControllerName =
      TextEditingController();
  final TextEditingController textEditingControllerLastName =
      TextEditingController();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword1 =
      TextEditingController();
  final TextEditingController textEditingControllerPassword2 =
      TextEditingController();
  final TextEditingController textEditingControllerCpf =
      TextEditingController();
  final TextEditingController textEditingControllerPhone =
      TextEditingController();
  final TextEditingController textEditingControllerAddress =
      TextEditingController();

  final TextEditingController textEditingControllerdateOfBirth =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  CadastroController(this.apiRepository);

  void dispose() {
    textEditingControllerName.dispose();
    textEditingControllerLastName.dispose();
    textEditingControllerPassword1.dispose();
    textEditingControllerPassword2.dispose();
    textEditingControllerEmail.dispose();
    textEditingControllerCpf.dispose();
    textEditingControllerAddress.dispose();
    textEditingControllerPhone.dispose();
    textEditingControllerdateOfBirth.dispose();
  }

  void cadastro(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login');
    }
  }
}
