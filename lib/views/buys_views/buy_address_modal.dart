import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/compra.dart';
import 'package:flutter/material.dart';

class BuyAddressModal extends StatelessWidget {
  final Compra compra;

  BuyAddressModal(this.compra);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _body(),
    );
  }

  _body() {
    final address = compra.cliente!.endereco!.split(",");
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: CustomText(
            texto: "Endereço de entrega:",
            bold: true,
            cor: Colors.black,
            tamanhoFonte: 17,
          ),
        ),
        _addressItem(
          "Bairro: ",
          address[0],
        ),
        _addressItem(
          "Rua: ",
          address[1],
        ),
        _addressItem(
          "Número da casa: ",
          address[2],
        ),
        _addressItem(
          "Ponto de referência: ",
          address[3],
        ),
      ],
    );
  }

  _addressItem(String txt1, String txt2) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Flexible(
            child: CustomText(
              texto: txt1,
              cor: Colors.black,
              bold: true,
              tamanhoFonte: 17,
            ),
          ),
          CustomText(
            texto: txt2,
            cor: Colors.black,
            tamanhoFonte: 17,
          ),
        ],
      ),
    );
  }
}
