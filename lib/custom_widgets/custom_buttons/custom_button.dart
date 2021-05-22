import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final Function() function;
  final Color? buttonColor;
  final Color? textColor;
  final bool? progress;

  CustomButton({
    required this.width,
    required this.title,
    required this.function,
    this.buttonColor,
    this.textColor,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: buttonColor != null ? buttonColor : Colors.green,
        borderRadius: BorderRadius.circular(18),
      ),
      child: progress == true
          ? Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : TextButton(
              onPressed: function,
              child: CustomText(
                texto: title,
                cor: textColor != null ? textColor : Colors.white,
                bold: true,
                tamanhoFonte: 20,
              ),
            ),
    );
  }
}
