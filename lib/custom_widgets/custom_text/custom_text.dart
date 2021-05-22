import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String texto;
  final int? maxLines;
  final bool? overFlow;
  final Color? cor;
  final double? tamanhoFonte;
  final bool bold;
  final bool underline;

  CustomText({
    required this.texto,
    this.maxLines,
    this.overFlow = false,
    this.cor,
    this.tamanhoFonte,
    this.bold = false,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      maxLines: maxLines,
      overflow: overFlow == true ? TextOverflow.ellipsis : TextOverflow.visible,
      style: TextStyle(
        color: cor,
        fontSize: tamanhoFonte,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
