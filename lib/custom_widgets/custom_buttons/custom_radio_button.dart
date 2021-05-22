import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final int groupValue;
  final int value;
  final Function onChanged;

  CustomRadioButton(this.text, this.groupValue, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              onChanged(value);
            },
            activeColor: Colors.green[900],
          ),
          Container(
            child: CustomText(
              texto: text,
            ),
          ),
        ],
      ),
    );
  }
}
