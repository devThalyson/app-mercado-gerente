import 'package:app_mercado_admin/controller/buys_controllers/buys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado_admin/model/compra.dart';
import 'package:app_mercado_admin/utils/alert.dart';
import 'package:app_mercado_admin/utils/convert_methods/convert_date.dart';
import 'package:app_mercado_admin/utils/convert_methods/convert_money.dart';
import 'package:app_mercado_admin/views/buys_views/buy_address_modal.dart';
import 'package:app_mercado_admin/views/buys_views/buy_products_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyItem extends StatelessWidget {
  final Compra compra;

  BuyItem(this.compra);

  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<BuysController>(context);

    // Convertendo data da compra para o formato correto
    final String buyDate = ConvertDate().convertDate(compra.dataDeCompra!);

    // Convertendo a hora da compra para o formato correto
    final String buyHour = ConvertDate().convertHour(compra.dataDeCompra!);

    /// Snack-bar's criados para aparecer quando se confirma ou
    /// rejeita uma compra

    final snack1 = SnackBar(
      content: CustomText(
        texto: "Compra confirmada com sucesso!",
        cor: Colors.white,
        bold: true,
      ),
      backgroundColor: Colors.green[900],
      duration: Duration(milliseconds: 800),
    );
    final snack2 = SnackBar(
      content: CustomText(
        texto: "Compra Rejeitada com sucesso!",
        cor: Colors.white,
        bold: true,
      ),
      backgroundColor: Colors.red[900],
      duration: Duration(milliseconds: 800),
    );

    /// Snack-bar's criados para aparecer quando se confirma ou
    /// rejeita uma compra

    return Container(
      margin: EdgeInsets.only(
        left: 6,
        right: 6,
        top: 4,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.orange.shade700,
          width: 2.5,
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              _rowOne(buyDate, buyHour),
              _rowTwo(),
              _rowThree(),
              _rowFour(context),
              _lookProducts(context),
              _acceptBuy(context, _controllerView, snack1, snack2),
            ],
          ),
        ),
      ),
    );
  }

  _rowOne(String date, String hour) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: _richText(
                "Compra feita em: ", "$date ás $hour", false, Colors.black),
          ),
          _richText(
              "Troco: ",
              ConvertMoney().convertReal(
                compra.troco!,
              ),
              true,
              Colors.green.shade700)
        ],
      ),
    );
  }

  _rowTwo() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: _richText(
                "Recebimento: ", "${compra.recebimento}", false, Colors.black),
          ),
          _richText(
              "Pagamento: ", "${compra.formaDePagamento}", false, Colors.black),
        ],
      ),
    );
  }

  _rowThree() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: _richText(
              "Status da compra: ",
              "${compra.status}",
              true,
              compra.status == "Pendente"
                  ? Colors.orange.shade700
                  : compra.status == "Confirmada"
                      ? Colors.green.shade900
                      : Colors.red.shade900,
            ),
          ),
          _richText(
              "Valor total: ",
              ConvertMoney().convertReal(
                compra.preco!,
              ),
              true,
              Colors.green.shade700),
        ],
      ),
    );
  }

  _rowFour(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: _richText(
                "Cliente: ", "${compra.cliente!.nome}", false, Colors.black),
          ),
          compra.recebimento == "Receber em casa"
              ? Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                      ),
                      child: CustomText(
                        texto: "Entregar em: ",
                        cor: Colors.black,
                        bold: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return BuyAddressModal(compra);
                          },
                        );
                      },
                      child: Container(
                        child: CustomText(
                          texto: "Ver Endereço",
                          underline: true,
                          cor: Colors.blue[700],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  _lookProducts(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 10,
            ),
            height: 40,
            width: 40,
            child: Image.asset("assets/images/frutas.png"),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return BuyProductsModal(compra.produtos!);
                },
              );
            },
            child: CustomText(
              texto: "Ver produtos da compra!",
              bold: true,
              tamanhoFonte: 17,
              cor: Colors.deepPurple[900],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            height: 40,
            width: 40,
            child: Image.asset("assets/images/compras.png"),
          ),
        ],
      ),
    );
  }

  _acceptBuy(BuildContext context, BuysController _controllerView,
      SnackBar snack1, SnackBar snack2) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 15,
            left: 5,
            right: 5,
          ),
          child: CustomText(
            texto: "Aceitar compra?",
            bold: true,
            cor: Colors.black,
            tamanhoFonte: 17,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {
                  Alert(
                    msg: "Tem certeza que deseja aceitar a compra?",
                    okOrNot: true,
                    function: () {
                      _controllerView.changeBuysLoaded();
                      _controllerView.updateBuyStatus(compra, "Confirmada");
                      ScaffoldMessenger.of(context).showSnackBar(snack1);
                    },
                  ).showDialog(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 40,
                ),
                onPressed: () {
                  _rejectBuyAlert(
                      context, "Tem certeza que deseja recusar a compra", () {
                    _controllerView.changeBuysLoaded();
                    _controllerView.updateBuyStatus(compra, "Rejeitada");
                    ScaffoldMessenger.of(context).showSnackBar(snack2);
                  }, _controllerView);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _rejectBuyAlert(
    BuildContext context,
    String msg,
    Function function,
    BuysController _controllerView,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: CustomText(texto: msg),
            actions: [
              TextButton(
                child: CustomText(
                  texto: "Sim",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () {
                  _controllerView.checkFormValidate();
                  if (_controllerView.formKeyValidate == true) {
                    Navigator.pop(context);
                    function();
                  }
                },
              ),
              TextButton(
                child: CustomText(
                  texto: "Cancelar",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            content: Form(
              key: _controllerView.formKey,
              child: CustomTextForm(
                dicaCampo: "Motivo da rejeição",
                maxLines: null,
                controller: _controllerView.rejectMotive,
                validator: _controllerView.validatorAllFields,
                acaoTeclado: TextInputAction.done,
                tipoTeclado: TextInputType.text,
              ),
            ),
          ),
        );
      },
    );
  }

  _richText(String text1, String text2, bool bold, Color color) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: ('Google'),
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              color: color,
              fontFamily: ('Google'),
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
