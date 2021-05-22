import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSoldOffButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 2,
        left: 2,
        right: 2,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              texto: "Indisponível",
              bold: true,
              cor: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 3),
              child: Icon(
                Icons.lock_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
