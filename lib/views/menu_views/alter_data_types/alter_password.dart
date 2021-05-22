import 'package:app_mercado_admin/controller/menu_controllers/menu_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/views/user_views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlterPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<MenuController>(context);
    _controllerView.clearPasswordFields();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          texto: "Alterar Senha",
          bold: true,
        ),
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(MenuController _controllerView, BuildContext context) {
    return Form(
      key: _controllerView.passwordFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8),
              elevation: 14,
              child: Observer(
                builder: (_) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Digite a Atual Senha Cadastrada: ",
                          tamanhoFonte: 18,
                          bold: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 5,
                          right: 5,
                          bottom: 20,
                        ),
                        child: CustomTextForm(
                          dicaCampo: "Atual Senha",
                          controller: _controllerView.actualPasswordController,
                          acaoTeclado: TextInputAction.next,
                          esconderTexto: true,
                          tipoTeclado: TextInputType.text,
                          validator: _controllerView.validatorExistingPassword,
                          icone: Icon(
                            Icons.lock_rounded,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Digite Uma Nova Senha: ",
                          tamanhoFonte: 18,
                          bold: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 5,
                          right: 5,
                          bottom: 20,
                        ),
                        child: CustomTextForm(
                          dicaCampo: "Nova Senha",
                          esconderTexto: true,
                          controller: _controllerView.newPasswordController,
                          acaoTeclado: TextInputAction.next,
                          tipoTeclado: TextInputType.text,
                          validator: _controllerView.validatorNewPassword,
                          icone: Icon(
                            Icons.lock_rounded,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Repita a Nova Senha",
                          tamanhoFonte: 18,
                          bold: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 5,
                          right: 5,
                          bottom: 10,
                        ),
                        child: CustomTextForm(
                          dicaCampo: "Nova Senha",
                          esconderTexto: true,
                          controller:
                              _controllerView.repeatNewPasswordController,
                          acaoTeclado: TextInputAction.done,
                          tipoTeclado: TextInputType.text,
                          validator: _controllerView.validatorRepeatNewPassword,
                          icone: Icon(
                            Icons.lock_rounded,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: CustomButton(
                          width: double.infinity,
                          title: "Atualizar Senha",
                          progress: _controllerView.progress,
                          function: () {
                            _controllerView.checkPasswordFormValidate();
                            if (_controllerView.passwordFormValidate == true) {
                              _updateClientPassword(context, _controllerView);
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateClientPassword(
      BuildContext context, MenuController _controllerView) async {
    await _controllerView.updateClientPassword();
    Alert(
      msg: _controllerView.passwordMsg,
      push: true,
      pushWidget: LoginView(),
    ).showDialog(context);
  }
}
