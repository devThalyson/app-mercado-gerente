import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/controller/products_controllers/products_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_radio_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/utils/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductUpdate extends StatelessWidget {
  final Produto produto;

  ProductUpdate(this.produto);

  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<ProductsController>(context);

    _controllerView.setCategoryController(
      Provider.of<CategorysController>(context),
    );

    final _categorysController = _controllerView.categorysController;

    _controllerView.fillUpdateFields(produto);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Atualizar Produto",
          bold: true,
        ),
        centerTitle: true,
      ),
      body: _body(_controllerView, _categorysController, context, produto),
    );
  }

  _body(
      ProductsController _controllerView,
      CategorysController _categorysController,
      BuildContext context,
      Produto produto) {
    return Observer(
      builder: (_) {
        return _categorysController.progress == true
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green[900],
                ),
              )
            : SingleChildScrollView(
                child: Form(
                  key: _controllerView.formKeyUpdate,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _productPreview(_controllerView, _categorysController),
                        _productMetric(_controllerView),
                        _productValues(_controllerView),
                        _productFinalized(_controllerView, context, produto),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  _productPreview(ProductsController _controllerView,
      CategorysController _categorysController) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: CustomText(
            texto: "Imagem:",
            bold: true,
            tamanhoFonte: 18,
          ),
        ),
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
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: CustomText(
            texto: "Nome:",
            bold: true,
            tamanhoFonte: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Nome",
            controller: _controllerView.controllerNameUpdate,
            validator: _controllerView.validatorAllFields,
            acaoTeclado: TextInputAction.next,
            tipoTeclado: TextInputType.text,
            suficone: Icon(
              Icons.text_fields,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: CustomText(
            texto: "Descrição:",
            bold: true,
            tamanhoFonte: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Descrição",
            controller: _controllerView.controllerDescriptionUpdate,
            validator: _controllerView.validatorAllFields,
            tipoTeclado: TextInputType.multiline,
            maxLines: null,
            suficone: Icon(
              Icons.description,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 5,
          ),
          child: CustomText(
            texto: "Categoria do produto:",
            tamanhoFonte: 18,
            bold: true,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: DropDown<Categoria>(
            _categorysController.categorys,
            "Selecione",
            _categorysController.categoryUpdate,
            _categorysController.changeCategoryUpdate,
          ),
        ),
      ],
    );
  }

  _productMetric(ProductsController _controllerView) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 5,
          ),
          child: CustomText(
            texto: "Medida de venda do produto: ",
            tamanhoFonte: 18,
            bold: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioButton(
              "Kilo-grama",
              _controllerView.metricProductUpdate,
              0,
              _controllerView.setRadioMetricProductUpdate,
            ),
            CustomRadioButton(
              "Grama",
              _controllerView.metricProductUpdate,
              1,
              _controllerView.setRadioMetricProductUpdate,
            ),
            CustomRadioButton(
              "Litro",
              _controllerView.metricProductUpdate,
              2,
              _controllerView.setRadioMetricProductUpdate,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomRadioButton(
              "Mili-litros",
              _controllerView.metricProductUpdate,
              3,
              _controllerView.setRadioMetricProductUpdate,
            ),
            CustomRadioButton(
              "Unidade",
              _controllerView.metricProductUpdate,
              4,
              _controllerView.setRadioMetricProductUpdate,
            ),
          ],
        ),
      ],
    );
  }

  _productValues(ProductsController _controllerView) {
    return Column(
      children: [
        _controllerView.metricProductUpdate != 4
            ? Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: CustomText(
                      texto: "Peso:",
                      bold: true,
                      tamanhoFonte: 18,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CustomTextForm(
                      dicaCampo: "Peso",
                      controller: _controllerView.controllerWeightUpdate,
                      validator: _controllerView.validatorAllFields,
                      acaoTeclado: TextInputAction.next,
                      tipoTeclado: TextInputType.number,
                      suficone: Icon(Icons.line_weight),
                    ),
                  )
                ],
              )
            : Container(),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: CustomText(
            texto: "Minímo de venda:",
            bold: true,
            tamanhoFonte: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Minímo de venda",
            controller: _controllerView.controllerMinimumSaleUpdate,
            validator: _controllerView.validatorAllFields,
            acaoTeclado: TextInputAction.next,
            tipoTeclado: TextInputType.number,
            suficone: Icon(Icons.minimize),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: CustomText(
            texto: "Preço:",
            bold: true,
            tamanhoFonte: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Preço",
            controller: _controllerView.controllerPriceUpdate,
            validator: _controllerView.validatorAllFields,
            acaoTeclado: TextInputAction.done,
            tipoTeclado: TextInputType.number,
            suficone: Icon(Icons.attach_money_outlined),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 5,
          ),
          child: CustomText(
            texto: "Produto disponível: ",
            tamanhoFonte: 18,
            bold: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioButton(
              "Sim",
              _controllerView.productDisponibility,
              0,
              _controllerView.setRadioProductDisponibility,
            ),
            CustomRadioButton(
              "Não",
              _controllerView.productDisponibility,
              1,
              _controllerView.setRadioProductDisponibility,
            ),
          ],
        ),
      ],
    );
  }

  _productFinalized(ProductsController _controllerView, BuildContext context,
      Produto produto) {
    return Container(
      margin: EdgeInsets.all(10),
      child: CustomButton(
        width: double.infinity,
        title: "Atualizar Produto",
        progress: _controllerView.progressUpdateProduct,
        function: () {
          _controllerView.formUpdateProductCheck();
          if (_controllerView.formUpdateProductValidate!) {
            _updateProduct(_controllerView, context, produto);
          }
        },
      ),
    );
  }

  _updateProduct(ProductsController _controllerView, BuildContext context,
      Produto produto) {
    Alert(
      msg: "Tem certeza que deseja atualizar o produto?",
      okOrNot: true,
      function: () async {
        await _controllerView.updateProduct(produto);
        Alert(msg: _controllerView.updateProductMessage).showDialog(context);
      },
    ).showDialog(context);
  }
}
