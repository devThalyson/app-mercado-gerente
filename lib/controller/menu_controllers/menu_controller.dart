import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/service/user_services/update_service.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  Cliente? cliente;

  @observable
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  @observable
  TextEditingController actualEmailController = TextEditingController();

  @observable
  TextEditingController newEmailController = TextEditingController();

  @observable
  TextEditingController repeatNewEmailController = TextEditingController();

  TextEditingController actualPasswordController = TextEditingController();

  @observable
  TextEditingController newPasswordController = TextEditingController();

  @observable
  TextEditingController repeatNewPasswordController = TextEditingController();

  @observable
  String emailMsg = "";

  @observable
  String passwordMsg = "";

  @observable
  bool? emailFormValidate;

  @observable
  bool? passwordFormValidate;

  @observable
  bool progress = false;

  @action
  getClient() async {
    cliente = await Cliente.get();
  }

  @action
  clearCachedClient() {
    Cliente.clear();
    cliente = null;
  }

  @action
  clearEmailFields() {
    newEmailController.text = "";
    actualEmailController.text = "";
    repeatNewEmailController.text = "";
  }

  @action
  clearPasswordFields() {
    newPasswordController.text = "";
    actualPasswordController.text = "";
    repeatNewPasswordController.text = "";
  }

  @action
  Future<dynamic> updateClientEmail() async {
    String email = newEmailController.text;
    progress = true;
    ApiResponse response = await UpdateService.put(email: email);
    progress = false;
    if (response.ok == true) {
      emailMsg = "E-mail atualizado com sucesso! Faça login novamente!";
      clearEmailFields();
      clearCachedClient();
    } else {
      emailMsg = response.msg!;
    }
  }

  @action
  updateClientPassword() async {
    String password = newPasswordController.text;
    progress = true;
    ApiResponse response = await UpdateService.put(senha: password);
    progress = false;
    if (response.ok == true) {
      passwordMsg = "Senha atualizada com sucesso! Faça login novamente!";
      clearPasswordFields();
      clearCachedClient();
    } else {
      passwordMsg = response.msg!;
    }
  }

  @action
  checkEmailFormValidate() {
    emailFormValidate = emailFormKey.currentState!.validate();
  }

  @action
  checkPasswordFormValidate() {
    passwordFormValidate = passwordFormKey.currentState!.validate();
  }

  ////// INICIO - Validações de formulário //////

  String? validatorExistingEmail(String? txt) {
    if (txt!.isEmpty || txt != cliente!.email) {
      return "O E-mail já cadastrado é diferente!";
    }
  }

  String? validatorNewEmail(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }

  String? validatorRepeatNewEmail(String? txt) {
    if (txt != newEmailController.text) {
      return "Os novos e-mails não coicidem!";
    }
  }

  String? validatorExistingPassword(String? txt) {
    if (txt!.isEmpty || !DBCrypt().checkpw(txt, cliente!.senha!)) {
      return "A senha atual é diferente!";
    }
  }

  String? validatorNewPassword(String? txt) {
    if (txt!.isEmpty || txt.length < 5) {
      return "Minímo de 5 Caracteres";
    }
  }

  String? validatorRepeatNewPassword(String? txt) {
    if (txt! != newPasswordController.text) {
      return "As senhas não coicidem!";
    }
  }

  ////// FIM - Validações de formulário //////

}
