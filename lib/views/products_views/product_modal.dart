import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/convert_methods/convert_money.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/products_views/product_update.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductModal extends StatelessWidget {
  final Produto produto;

  ProductModal(this.produto);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.black12,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: produto.imagem!,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  texto: produto.nome!,
                  tamanhoFonte: 16,
                  bold: true,
                ),
              ),
              CustomText(
                texto: "/",
              ),
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  texto: produto.peso.toString(),
                  bold: true,
                  tamanhoFonte: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    texto: produto.descricao!,
                    tamanhoFonte: 16,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        push(context, ProductUpdate(produto));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green.shade900,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CustomText(
                      texto: ConvertMoney().convertReal(produto.preco!),
                      tamanhoFonte: 21,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
