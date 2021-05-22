import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/convert_methods/convert_money.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItemClientBuys extends StatelessWidget {
  final Produto produto;
  final int quantity;

  ProductItemClientBuys(this.produto, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(
                  right: 4,
                ),
                child: CachedNetworkImage(
                  imageUrl: produto.imagem!,
                  placeholder: (_, url) => Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green[900],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      texto: "${produto.nome}  -  ${produto.peso}",
                      bold: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 3,
                          ),
                          child: CustomText(
                            texto: ConvertMoney().convertReal(produto.preco!),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 3,
                      left: 5,
                    ),
                    child: CustomText(
                      texto: "Quantidade",
                      bold: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 3,
                      left: 5,
                    ),
                    child: CustomText(
                      texto: _checkQuantity(quantity * produto.minimoVenda!),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Divider(
              color: Colors.black,
              height: 3,
            ),
          ),
        ],
      ),
    );
  }
}

String _checkQuantity(double quantity) {
  if (quantity % 1 == 0) {
    return quantity.truncate().toString();
  } else {
    return quantity.toStringAsFixed(3);
  }
}
