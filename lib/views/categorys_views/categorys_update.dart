import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_radio_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CategorysUpdate extends StatelessWidget {
  final Categoria category;

  CategorysUpdate(this.category);

  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<CategorysController>(context);
    _controllerView.fillAllFields(category);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Editar Categoria",
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
            key: _controllerView.formKeyUpdateCategory,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomTextForm(
                      dicaCampo: "Imagem",
                      controller: _controllerView.controllerImageUpdate,
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
                      controller: _controllerView.controllerNameUpdate,
                      validator: _controllerView.validatorAllFields,
                      acaoTeclado: TextInputAction.done,
                      tipoTeclado: TextInputType.text,
                      suficone: Icon(
                        Icons.text_fields,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomText(
                          texto: "Estado da categoria: ",
                          tamanhoFonte: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomRadioButton(
                                "Ativa",
                                _controllerView.radioCategoryAtive,
                                0,
                                _controllerView.changeRadioCategoryAtive),
                            CustomRadioButton(
                                "Inativa",
                                _controllerView.radioCategoryAtive,
                                1,
                                _controllerView.changeRadioCategoryAtive),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    width: double.infinity,
                    progress: _controllerView.progressUpdateCategory,
                    title: "Atualizar",
                    function: () {
                      _controllerView.validateFormUpdateCategory();
                      if (_controllerView.formKeyUpdateCategoryValidate ==
                          true) {
                        _updateCategory(_controllerView, context);
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

  _updateCategory(
      CategorysController _controllerView, BuildContext context) async {
    await _controllerView.updateCategory(category);

    Alert(msg: _controllerView.msgUpdateCategory).showDialog(context);
  }
}
