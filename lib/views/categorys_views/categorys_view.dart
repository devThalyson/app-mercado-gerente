import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/categorys_views/categorys_add.dart';
import 'package:app_mercado_admin/views/categorys_views/categorys_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CategorysView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<CategorysController>(context);
    _controllerView.getCategorys();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Categorias",
          bold: true,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              push(context, CategorysAdd());
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return _controllerView.progress == true
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green[900],
                  ),
                )
              : _body(_controllerView.categorys);
        },
      ),
    );
  }

  _body(List<Categoria> categorys) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisExtent: 150,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 10,
      ),
      itemCount: categorys.length,
      itemBuilder: (context, index) {
        categorys.sort(
          (a, b) => a.nome!.compareTo(b.nome!),
        );
        Categoria category = categorys[index];

        return CategorysCard(category);
      },
    );
  }
}
