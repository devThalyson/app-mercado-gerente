import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:app_mercado_admin/views/menu_views/alter_data_types/alter_email.dart';
import 'package:app_mercado_admin/views/menu_views/alter_data_types/alter_password.dart';
import 'package:flutter/material.dart';

class UserAlterData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _itemAlterData(
            "Alterar E-mail",
            Icons.email,
            () {
              push(context, AlterEmail());
            },
          ),
          _itemAlterData(
            "Alterar Senha",
            Icons.lock_rounded,
            () {
              push(context, AlterPassword());
            },
          ),
        ],
      ),
    );
  }

  _itemAlterData(String text, IconData icon, Function function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              texto: text,
              bold: true,
              cor: Colors.black,
              tamanhoFonte: 17,
            ),
            Icon(
              icon,
              color: Colors.green[900],
            ),
          ],
        ),
      ),
    );
  }
}
