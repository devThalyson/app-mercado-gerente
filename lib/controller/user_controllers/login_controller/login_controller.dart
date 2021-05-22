import 'package:app_mercado_admin/service/user_services/login_service.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  ////// INICIO - Observables //////
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @observable
  bool blockPassword = true;

  @observable
  String errorMsg = "";

  @observable
  bool progress = false;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////
  @action
  changeBLockPassword() {
    blockPassword = !blockPassword;
  }

  @action
  Future<dynamic> loginFunction() async {
    // Checa primeiramente se o formulário de Login está validado.
    if (!formKey.currentState!.validate()) {
      return;
    }
    // Caso o formulário de login seja válido, a tentativa de
    // login é feita.
    else {
      // O icone de progresso vai aparecer no botão de login.
      progress = true;
      ApiResponse response = await LoginService.login(
          controllerEmail.text, controllerPassword.text);

      // Se os dados (e-mail e senha) forem válidos, o login é
      // completado com sucesso.
      if (response.ok == true) {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;

        return true;
      }
      // Se a tentativa for falha, um erro é retornado.
      else {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;

        errorMsg = response.msg.toString();

        return false;
      }
    }
  }
  ////// FIM - Actions //////

  ////// INICIO - Validações de formulário //////
  String? validatorLoginField(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }

  String? validatorPasswordField(String? txt) {
    if (txt!.isEmpty) {
      return "Preencha o campo de senha!";
    }
  }
  ////// FIM - Validações de formulário //////
}
