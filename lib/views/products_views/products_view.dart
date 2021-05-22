import 'package:app_mercado_admin/controller/products_controllers/products_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/products_views/product_add.dart';
import 'package:app_mercado_admin/views/products_views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<ProductsController>(context);
    _getProducts(_controllerView);

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Produtos",
          bold: true,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              push(context, ProductAdd());
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return _controllerView.productsLoaded == false
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green[900],
                  ),
                )
              : _body(_controllerView);
        },
      ),
    );
  }

  _body(ProductsController _controllerView) {
    return Column(
      children: [
        _searchProduct(_controllerView),
        _gridView(
          _controllerView,
        ),
      ],
    );
  }

  _getProducts(ProductsController _controllerView) {
    if (_controllerView.productsLoaded == false) {
      _controllerView.getProducts();
    }
  }

  _searchProduct(ProductsController _controllerView) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
        onChanged: (search) {
          print("##### $search #####");
          _controllerView.searchProducts(search);
          print("##### $search #####");
        },
        decoration: InputDecoration(
          hintText: "Pesquise um produto",
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _gridView(ProductsController _controllerView) {
    List<Produto> products = _controllerView.searchedProducts == true
        ? _controllerView.cachedProducts!
        : _controllerView.products;
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 225,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          products.sort(
            (a, b) => a.nome!.compareTo(b.nome!),
          );
          Produto produto = products[index];

          return ProductCard(produto);
        },
      ),
    );
  }
}
