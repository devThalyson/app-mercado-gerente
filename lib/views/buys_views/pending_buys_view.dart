import 'package:app_mercado_admin/controller/buys_controllers/buys_controller.dart';
import 'package:app_mercado_admin/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado_admin/model/compra.dart';
import 'package:app_mercado_admin/views/buys_views/buy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PendingBuysView extends StatefulWidget {
  @override
  _PendingBuysViewState createState() => _PendingBuysViewState();
}

class _PendingBuysViewState extends State<PendingBuysView> {
  @override
  void initState() {
    super.initState();

    Provider.of<BuysController>(context, listen: false).getClientBuys();

    Provider.of<BuysController>(context, listen: false).listenWebSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          texto: "Compras Pendentes",
          bold: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          return Provider.of<BuysController>(context, listen: false).progress ==
                  true
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green[900],
                  ),
                )
              : _body(context);
        },
      ),
    );
  }

  _body(BuildContext context) {
    return Provider.of<BuysController>(context, listen: false)
                .pendingBuys
                .length >
            0
        ? _listBuys(context,
            Provider.of<BuysController>(context, listen: false).pendingBuys)
        : Center(
            child: CustomText(
              texto: "Não existem compras pendentes no momento!",
              bold: true,
              tamanhoFonte: 18,
              cor: Colors.orange[700],
            ),
          );
  }

  _listBuys(BuildContext context, List<Compra> pendingBuys) {
    return ListView.builder(
      padding: EdgeInsets.all(3),
      itemCount: pendingBuys.length,
      itemBuilder: (context, index) {
        Compra compra = pendingBuys[index];
        return BuyItem(compra);
      },
    );
  }
}
