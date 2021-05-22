import 'dart:async';

import 'package:app_mercado_admin/model/compra.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/service/buys_services/buys_service.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:app_mercado_admin/utils/api_utils/web_socket.dart';
import 'package:app_mercado_admin/utils/local_notifications/notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'buys_controller.g.dart';

class BuysController = _BuysControllerBase with _$BuysController;

abstract class _BuysControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  NotificationService notificationService = NotificationService();

  @observable
  List<Compra> pendingBuys = ObservableList<Compra>();

  @observable
  List<Produto> separatedProducts = ObservableList<Produto>();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController rejectMotive = TextEditingController();

  @observable
  WebSocket webSocket = WebSocket();

  @observable
  bool webSocketListened = false;

  @observable
  bool progress = false;

  @observable
  bool alterBuyStatusProgress = false;

  @observable
  bool? formKeyValidate;

  @observable
  bool? buysLoaded = false;

  @observable
  String pendingBuysErrorMsg = "";

  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  Future<dynamic> getClientBuys() async {
    if (buysLoaded == false) {
      buysLoaded = true;
      progress = true;
      ApiResponse response = await BuysSevice.getBuysByStatus("Pendente");
      if (response.result != null) {
        pendingBuys = response.result;
        progress = false;
      } else {
        pendingBuysErrorMsg = response.msg!;
        progress = false;
      }
    }
  }

  @action
  changeBuysLoaded() {
    buysLoaded = false;
  }

  @action
  listenWebSocket() {
    if (webSocketListened == false) {
      notificationService.init();
      webSocket.channel.stream.listen(
        (event) {
          notificationService.showNotification();
          print(" #### listening web socket ####");

          changeBuysLoaded();
          getClientBuys();
          webSocketListened = true;
          print(" #### listening web socket ####");
        },
      );
    }
  }

  @action
  closeWebSocket() {
    webSocket.close();
    print("dispose close ws");
  }

  @action
  updateBuyStatus(Compra compra, String status) async {
    alterBuyStatusProgress = true;
    compra.status = status;
    compra.motivoRejeicao = rejectMotive.text;
    ApiResponse response = await BuysSevice.put(compra);

    if (response.ok == true) {
      alterBuyStatusProgress = false;
      pendingBuysErrorMsg = "";
      rejectMotive.text = "";
      getClientBuys();
    } else {
      alterBuyStatusProgress = false;
      pendingBuysErrorMsg = response.msg!;
    }
  }

  @action
  setSeparetedProducts(List<Produto> products) {
    /// Variavel que vai ser usada pra comparar os ids dos produtos da lista
    /// de produtos da compra.
    final existingProducts = Set<int>();

    /// Lista sem produtos duplicadas que vai ser exibida no card de
    /// produtos da compra!
    separatedProducts =
        products.where((produto) => existingProducts.add(produto.id!)).toList();
  }

  /// Método que checa quantos produtos de um mesmo tipo estão na lista
  /// de produtos da compra.
  @action
  int checkQuantityOfProductInBuyList(Produto produto, List<Produto> products) {
    int quantityProductsRepeteads = products
        .map((element) => element.id == produto.id ? 1 : 0)
        .reduce((value, element) => value + element);

    return quantityProductsRepeteads;
  }

  @action
  checkFormValidate() {
    formKeyValidate = formKey.currentState!.validate();
  }
  ////// FIM - Actions //////

  ////// INICIO - Validators //////

  String? validatorAllFields(String? txt) {
    if (txt!.isEmpty) {
      return "Campo Obrigatório";
    }
  }

  ////// FIM - Validators //////
}
