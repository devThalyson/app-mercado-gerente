import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/controller/products_controllers/products_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_radio_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/utils/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<ProductsController>(context);
    _controllerView.setCategoryController(
      Provider.of<CategorysController>(context),
    );
    final _categorysController = _controllerView.categorysController;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Adicionar Produto",
          bold: true,
        ),
        centerTitle: true,
      ),
      body: _body(_controllerView, context, _categorysController),
    );
  }

  _body(ProductsController _controllerView, BuildContext context,
      CategorysController _categorysController) {
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
                  key: _controllerView.formKey,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _productPreview(_controllerView, _categorysController),
                        _productMetric(_controllerView),
                        _productValues(_controllerView),
                        _productFinalized(_controllerView, context),
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
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Imagem",
            controller: _controllerView.controllerImage,
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
            acaoTeclado: TextInputAction.next,
            tipoTeclado: TextInputType.text,
            suficone: Icon(
              Icons.text_fields,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Descrição",
            controller: _controllerView.controllerDescription,
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
            _categorysController.category,
            _categorysController.changeCategory,
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
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioButton(
              "Kilo-grama",
              _controllerView.metricProduct,
              0,
              _controllerView.setRadioMetricProduct,
            ),
            CustomRadioButton(
              "Grama",
              _controllerView.metricProduct,
              1,
              _controllerView.setRadioMetricProduct,
            ),
            CustomRadioButton(
              "Litro",
              _controllerView.metricProduct,
              2,
              _controllerView.setRadioMetricProduct,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomRadioButton(
              "Mili-litros",
              _controllerView.metricProduct,
              3,
              _controllerView.setRadioMetricProduct,
            ),
            CustomRadioButton(
              "Unidade",
              _controllerView.metricProduct,
              4,
              _controllerView.setRadioMetricProduct,
            ),
          ],
        ),
      ],
    );
  }

  _productValues(ProductsController _controllerView) {
    return Column(
      children: [
        _controllerView.metricProduct != 4
            ? Container(
                margin: EdgeInsets.all(10),
                child: CustomTextForm(
                  dicaCampo: "Peso",
                  controller: _controllerView.controllerWeight,
                  validator: _controllerView.validatorAllFields,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.number,
                  suficone: Icon(Icons.line_weight),
                ),
              )
            : Container(),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Minímo de venda",
            controller: _controllerView.controllerMinimumSale,
            validator: _controllerView.validatorAllFields,
            acaoTeclado: TextInputAction.next,
            tipoTeclado: TextInputType.number,
            suficone: Icon(Icons.minimize),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomTextForm(
            dicaCampo: "Preço",
            controller: _controllerView.controllerPrice,
            validator: _controllerView.validatorAllFields,
            acaoTeclado: TextInputAction.done,
            tipoTeclado: TextInputType.number,
            suficone: Icon(Icons.attach_money_outlined),
          ),
        ),
      ],
    );
  }

  _productFinalized(ProductsController _controllerView, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: CustomButton(
        width: double.infinity,
        title: "Adicionar",
        progress: _controllerView.progressAddProduct,
        function: () {
          _controllerView.formAddProductCheck();
          if (_controllerView.formAddProductValidate!) {
            _addProduct(_controllerView, context);
          }
        },
      ),
    );
  }

  _addProduct(ProductsController _controllerView, BuildContext context) {
    return Alert(
      msg: "Tem certeza que deseja adicionar um novo produto?",
      okOrNot: true,
      function: () async {
        await _controllerView.addProduct();
        Alert(msg: _controllerView.addProductMessage).showDialog(context);
      },
    ).showDialog(context);
  }
}
