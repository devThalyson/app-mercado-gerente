import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/categorys_views/categorys_update.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategorysCard extends StatelessWidget {
  final Categoria category;

  CategorysCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 37,
                  width: 37,
                  margin: EdgeInsets.all(5),
                  child: CachedNetworkImage(
                    imageUrl: category.imagem!,
                    fit: BoxFit.cover,
                    placeholder: (_, url) => Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green[900],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: CustomText(
                    texto: category.nome!,
                    bold: true,
                    tamanhoFonte: 17,
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      push(context, CategorysUpdate(category));
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: CustomText(
                texto: category.ativa == 0 ? "Ativa" : "Inativa",
                cor: category.ativa == 0 ? Colors.green[900] : Colors.red[900],
                bold: true,
                tamanhoFonte: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
