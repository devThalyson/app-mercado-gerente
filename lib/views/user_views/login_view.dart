import 'package:app_mercado_admin/controller/user_controllers/login_controller/login_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  final _controllerView = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Form(
            key: _controllerView.formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5.5,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: CustomTextForm(
                        dicaCampo: "E-mail",
                        validator: _controllerView.validatorLoginField,
                        acaoTeclado: TextInputAction.next,
                        tipoTeclado: TextInputType.emailAddress,
                        controller: _controllerView.controllerEmail,
                        icone: Icon(
                          Icons.email,
                        ),
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: CustomTextForm(
                        dicaCampo: "Senha",
                        validator: _controllerView.validatorPasswordField,
                        acaoTeclado: TextInputAction.done,
                        tipoTeclado: TextInputType.text,
                        esconderTexto: _controllerView.blockPassword,
                        controller: _controllerView.controllerPassword,
                        icone: Icon(
                          Icons.lock,
                        ),
                        suficone: GestureDetector(
                          onTap: _controllerView.changeBLockPassword,
                          child: Icon(
                            _controllerView.blockPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_sharp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 35,
                    left: 10,
                    right: 10,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    progress: _controllerView.progress,
                    title: "Entrar",
                    function: () {
                      _login(context);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _login(BuildContext context) async {
    bool? response = await _controllerView.loginFunction();
    if (response != null) {
      response == false
          ? Alert(msg: _controllerView.errorMsg).showDialog(context)
          : push(context, HomeView(), replace: true);
    }
  }
}
