import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String dicaCampo;
  final Widget? icone;
  final bool? ativarCampo;
  final int? maxLenght;

  final Widget? suficone;
  final bool? fill;

  final Color? backGColor;

  final TextEditingController? controller;
  final TextInputType? tipoTeclado;
  final TextInputAction? acaoTeclado;

  final FormFieldValidator<String>? validator;

  final bool esconderTexto;

  final Function(String)? digitado;

  final int? maxLines;

  CustomTextForm({
    required this.dicaCampo,
    this.ativarCampo,
    this.controller,
    this.esconderTexto = false,
    this.validator,
    this.maxLenght,
    this.tipoTeclado,
    this.acaoTeclado,
    this.icone,
    this.backGColor,
    this.fill,
    this.suficone,
    this.digitado,
    this.maxLines = 1,
  });

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: esconderTexto,
      validator: validator,
      enabled: ativarCampo,
      onChanged: digitado,
      keyboardType: tipoTeclado,
      textInputAction: acaoTeclado,
      maxLength: maxLenght,
      maxLines: maxLines,
      style: TextStyle(),
      decoration: InputDecoration(
        fillColor: backGColor,
        filled: fill,
        prefixIcon: icone,
        suffixIcon: suficone,
        hintText: dicaCampo,
        errorStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red[900],
        ),
        labelStyle: TextStyle(
          fontSize: 19,
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          fontSize: 19,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}
