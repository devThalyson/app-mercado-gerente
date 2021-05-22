import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/utils/nav.dart';
import 'package:flutter/material.dart';

class Alert {
  final bool okOrNot;
  final String msg;
  final Function? function;
  final bool? push;
  final Widget? pushWidget;

  Alert({
    this.okOrNot = false,
    required this.msg,
    this.function,
    this.push = false,
    this.pushWidget,
  });

  showDialog(BuildContext context) {
    okOrNot
        ? _onClickDialogOkorNot(context, msg, function!,
            pushable: push, pushWidget: pushWidget)
        : _onClickDialog(context, msg, pushable: push, pushWidget: pushWidget);
  }
}

_onClickDialog(BuildContext context, String msg,
    {bool? pushable, Widget? pushWidget}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(msg),
          actions: [
            TextButton(
              child: CustomText(
                texto: "Ok",
                cor: Colors.blue[800],
                bold: true,
              ),
              onPressed: () async {
                Navigator.pop(context);

                if (pushable == true) {
                  push(context, pushWidget!, replace: true);
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

_onClickDialogOkorNot(BuildContext context, String msg, Function function,
    {bool? pushable, Widget? pushWidget}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(msg),
          actions: [
            TextButton(
              child: CustomText(
                texto: "Sim",
                cor: Colors.blue[800],
                bold: true,
              ),
              onPressed: () {
                function();
                Navigator.pop(context);
                if (pushable == true) {
                  push(context, pushWidget!, replace: true);
                }
              },
            ),
            TextButton(
              child: CustomText(
                texto: "Cancelar",
                cor: Colors.blue[800],
                bold: true,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
