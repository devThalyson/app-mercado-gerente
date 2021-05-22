import 'package:app_mercado_admin/controller/menu_controllers/menu_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/views/user_views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlterEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<MenuController>(context);
    _controllerView.clearEmailFields();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          texto: "Alterar E-mail",
          bold: true,
        ),
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(MenuController _controllerView, BuildContext context) {
    return Form(
      key: _controllerView.emailFormKey,
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
                          texto: "Digite o Atual E-mail Cadastrado: ",
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
                          dicaCampo: "Atual E-mail",
                          controller: _controllerView.actualEmailController,
                          acaoTeclado: TextInputAction.next,
                          tipoTeclado: TextInputType.emailAddress,
                          validator: _controllerView.validatorExistingEmail,
                          icone: Icon(
                            Icons.email,
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
                          texto: "Digite um novo E-mail: ",
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
                          dicaCampo: "ex: cliente@gmail.com",
                          controller: _controllerView.newEmailController,
                          acaoTeclado: TextInputAction.next,
                          tipoTeclado: TextInputType.emailAddress,
                          validator: _controllerView.validatorNewEmail,
                          icone: Icon(
                            Icons.email,
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
                          texto: "Repita o Novo E-mail",
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
                          dicaCampo: "ex: cliente@gmail.com",
                          controller: _controllerView.repeatNewEmailController,
                          acaoTeclado: TextInputAction.done,
                          tipoTeclado: TextInputType.emailAddress,
                          validator: _controllerView.validatorRepeatNewEmail,
                          icone: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: CustomButton(
                          width: double.infinity,
                          title: "Atualizar E-mail",
                          progress: _controllerView.progress,
                          function: () async {
                            _controllerView.checkEmailFormValidate();
                            if (_controllerView.emailFormValidate == true) {
                              await _updateClientEmail(
                                  context, _controllerView);
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

  _updateClientEmail(
      BuildContext context, MenuController _controllerView) async {
    await _controllerView.updateClientEmail();
    Alert(
      msg: _controllerView.emailMsg,
      push: true,
      pushWidget: LoginView(),
    ).showDialog(context);
  }
}
