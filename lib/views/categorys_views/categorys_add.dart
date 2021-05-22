import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CategorysAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<CategorysController>(context);
    _controllerView.resetAllFields();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Adicionar Categoria",
          bold: true,
        ),
        centerTitle: true,
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(CategorysController _controllerView, BuildContext context) {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          child: Form(
            key: _controllerView.formKeyAddCategory,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomTextForm(
                      dicaCampo: "Imagem",
                      controller: _controllerView.controllerimage,
                      validator: _controllerView.validatorAllFields,
                      acaoTeclado: TextInputAction.next,
                      tipoTeclado: TextInputType.text,
                      suficone: Icon(
                        Icons.image,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomTextForm(
                      dicaCampo: "Nome",
                      controller: _controllerView.controllerName,
                      validator: _controllerView.validatorAllFields,
                      acaoTeclado: TextInputAction.done,
                      tipoTeclado: TextInputType.text,
                      suficone: Icon(
                        Icons.text_fields,
                      ),
                    ),
                  ),
                  CustomButton(
                    width: double.infinity,
                    progress: _controllerView.progressAddCategory,
                    title: "Adicionar",
                    function: () {
                      _controllerView.validateFormAddCategory();
                      if (_controllerView.formKeyAddCategoryValidate == true) {
                        _addCategory(_controllerView, context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _addCategory(
      CategorysController _controllerView, BuildContext context) async {
    await _controllerView.addCategory();
    Alert(msg: _controllerView.msgAddCategory).showDialog(context);
  }
}
