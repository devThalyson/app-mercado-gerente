import 'package:app_mercado_admin/controller/buys_controllers/buys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/views/products_views/product_item_client_buys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyProductsModal extends StatelessWidget {
  final List<Produto> productsOfBuy;

  BuyProductsModal(this.productsOfBuy);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          CustomText(
            texto: "Produtos da compra: ",
            tamanhoFonte: 17,
            bold: true,
          ),
          _listProductsOfBuy(context, productsOfBuy)
        ],
      ),
    );
  }

  _listProductsOfBuy(BuildContext context, List<Produto> productsOfBuy) {
    Provider.of<BuysController>(context, listen: false)
        .setSeparetedProducts(productsOfBuy);
    List<Produto> separatedProducts =
        Provider.of<BuysController>(context, listen: false).separatedProducts;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: separatedProducts.length,
      itemBuilder: (context, index) {
        Produto produto = separatedProducts[index];

        int quantity = Provider.of<BuysController>(context, listen: false)
            .checkQuantityOfProductInBuyList(produto, productsOfBuy);
        return ProductItemClientBuys(produto, quantity);
      },
    );
  }
}
