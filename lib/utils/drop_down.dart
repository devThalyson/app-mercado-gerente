import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

abstract class DropDownItem {
  String text();
}

class DropDown<T> extends StatefulWidget {
  final State? parent;
  final List<T>? itens;
  final String? text;
  final T? value;
  final dynamic callback;

  DropDown(this.itens, this.text, this.value, ValueChanged<T> this.callback,
      {this.parent});

  @override
  DropDownState createState() {
    return new DropDownState();
  }
}

class DropDownState<T extends DropDownItem> extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: widget.value,
      isExpanded: true,
      items: items(),
      hint: CustomText(
        texto: widget.text!,
      ),
      onChanged: (newVal) {
        widget.callback(newVal);
      },
    );
  }

  items() {
    List<DropdownMenuItem<T>> list = widget.itens!.map<DropdownMenuItem<T>>(
      (val) {
        return DropdownMenuItem<T>(
          value: val,
          child: CustomText(
            texto: "${val.text()}",
            tamanhoFonte: 22,
          ),
        );
      },
    ).toList();

    return list;
  }
}
