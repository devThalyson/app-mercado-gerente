import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_available_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_buttons/custom_soldoff_button.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/convert_methods/convert_money.dart';
import 'package:app_mercado_admin/views/products_views/product_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Produto produto;

  ProductCard(this.produto);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: 3,
          left: 2,
          right: 2,
          bottom: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              texto: "${produto.nome} - ${produto.peso}",
              bold: true,
              maxLines: 2,
              overFlow: true,
              tamanhoFonte: 15,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return ProductModal(produto);
                  },
                );
              },
              child: Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.only(
                  left: 3,
                  right: 3,
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
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 2,
              ),
              child: CustomText(
                texto: ConvertMoney().convertReal(produto.preco!),
                bold: true,
                tamanhoFonte: 17,
              ),
            ),
            produto.indisponivel != 0
                ? CustomSoldOffButton()
                : CustomAvailableButton(),
          ],
        ),
      ),
    );
  }
}
