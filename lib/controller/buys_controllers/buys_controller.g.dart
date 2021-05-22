// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buys_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuysController on _BuysControllerBase, Store {
  final _$notificationServiceAtom =
      Atom(name: '_BuysControllerBase.notificationService');

  @override
  NotificationService get notificationService {
    _$notificationServiceAtom.reportRead();
    return super.notificationService;
  }

  @override
  set notificationService(NotificationService value) {
    _$notificationServiceAtom.reportWrite(value, super.notificationService, () {
      super.notificationService = value;
    });
  }

  final _$pendingBuysAtom = Atom(name: '_BuysControllerBase.pendingBuys');

  @override
  List<Compra> get pendingBuys {
    _$pendingBuysAtom.reportRead();
    return super.pendingBuys;
  }

  @override
  set pendingBuys(List<Compra> value) {
    _$pendingBuysAtom.reportWrite(value, super.pendingBuys, () {
      super.pendingBuys = value;
    });
  }

  final _$separatedProductsAtom =
      Atom(name: '_BuysControllerBase.separatedProducts');

  @override
  List<Produto> get separatedProducts {
    _$separatedProductsAtom.reportRead();
    return super.separatedProducts;
  }

  @override
  set separatedProducts(List<Produto> value) {
    _$separatedProductsAtom.reportWrite(value, super.separatedProducts, () {
      super.separatedProducts = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_BuysControllerBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$rejectMotiveAtom = Atom(name: '_BuysControllerBase.rejectMotive');

  @override
  TextEditingController get rejectMotive {
    _$rejectMotiveAtom.reportRead();
    return super.rejectMotive;
  }

  @override
  set rejectMotive(TextEditingController value) {
    _$rejectMotiveAtom.reportWrite(value, super.rejectMotive, () {
      super.rejectMotive = value;
    });
  }

  final _$webSocketAtom = Atom(name: '_BuysControllerBase.webSocket');

  @override
  WebSocket get webSocket {
    _$webSocketAtom.reportRead();
    return super.webSocket;
  }

  @override
  set webSocket(WebSocket value) {
    _$webSocketAtom.reportWrite(value, super.webSocket, () {
      super.webSocket = value;
    });
  }

  final _$webSocketListenedAtom =
      Atom(name: '_BuysControllerBase.webSocketListened');

  @override
  bool get webSocketListened {
    _$webSocketListenedAtom.reportRead();
    return super.webSocketListened;
  }

  @override
  set webSocketListened(bool value) {
    _$webSocketListenedAtom.reportWrite(value, super.webSocketListened, () {
      super.webSocketListened = value;
    });
  }

  final _$progressAtom = Atom(name: '_BuysControllerBase.progress');

  @override
  bool get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(bool value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$alterBuyStatusProgressAtom =
      Atom(name: '_BuysControllerBase.alterBuyStatusProgress');

  @override
  bool get alterBuyStatusProgress {
    _$alterBuyStatusProgressAtom.reportRead();
    return super.alterBuyStatusProgress;
  }

  @override
  set alterBuyStatusProgress(bool value) {
    _$alterBuyStatusProgressAtom
        .reportWrite(value, super.alterBuyStatusProgress, () {
      super.alterBuyStatusProgress = value;
    });
  }

  final _$formKeyValidateAtom =
      Atom(name: '_BuysControllerBase.formKeyValidate');

  @override
  bool? get formKeyValidate {
    _$formKeyValidateAtom.reportRead();
    return super.formKeyValidate;
  }

  @override
  set formKeyValidate(bool? value) {
    _$formKeyValidateAtom.reportWrite(value, super.formKeyValidate, () {
      super.formKeyValidate = value;
    });
  }

  final _$buysLoadedAtom = Atom(name: '_BuysControllerBase.buysLoaded');

  @override
  bool? get buysLoaded {
    _$buysLoadedAtom.reportRead();
    return super.buysLoaded;
  }

  @override
  set buysLoaded(bool? value) {
    _$buysLoadedAtom.reportWrite(value, super.buysLoaded, () {
      super.buysLoaded = value;
    });
  }

  final _$pendingBuysErrorMsgAtom =
      Atom(name: '_BuysControllerBase.pendingBuysErrorMsg');

  @override
  String get pendingBuysErrorMsg {
    _$pendingBuysErrorMsgAtom.reportRead();
    return super.pendingBuysErrorMsg;
  }

  @override
  set pendingBuysErrorMsg(String value) {
    _$pendingBuysErrorMsgAtom.reportWrite(value, super.pendingBuysErrorMsg, () {
      super.pendingBuysErrorMsg = value;
    });
  }

  final _$getClientBuysAsyncAction =
      AsyncAction('_BuysControllerBase.getClientBuys');

  @override
  Future<dynamic> getClientBuys() {
    return _$getClientBuysAsyncAction.run(() => super.getClientBuys());
  }

  final _$updateBuyStatusAsyncAction =
      AsyncAction('_BuysControllerBase.updateBuyStatus');

  @override
  Future updateBuyStatus(Compra compra, String status) {
    return _$updateBuyStatusAsyncAction
        .run(() => super.updateBuyStatus(compra, status));
  }

  final _$_BuysControllerBaseActionController =
      ActionController(name: '_BuysControllerBase');

  @override
  dynamic changeBuysLoaded() {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.changeBuysLoaded');
    try {
      return super.changeBuysLoaded();
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listenWebSocket() {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.listenWebSocket');
    try {
      return super.listenWebSocket();
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeWebSocket() {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.closeWebSocket');
    try {
      return super.closeWebSocket();
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeparetedProducts(List<Produto> products) {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.setSeparetedProducts');
    try {
      return super.setSeparetedProducts(products);
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int checkQuantityOfProductInBuyList(Produto produto, List<Produto> products) {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.checkQuantityOfProductInBuyList');
    try {
      return super.checkQuantityOfProductInBuyList(produto, products);
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkFormValidate() {
    final _$actionInfo = _$_BuysControllerBaseActionController.startAction(
        name: '_BuysControllerBase.checkFormValidate');
    try {
      return super.checkFormValidate();
    } finally {
      _$_BuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notificationService: ${notificationService},
pendingBuys: ${pendingBuys},
separatedProducts: ${separatedProducts},
formKey: ${formKey},
rejectMotive: ${rejectMotive},
webSocket: ${webSocket},
webSocketListened: ${webSocketListened},
progress: ${progress},
alterBuyStatusProgress: ${alterBuyStatusProgress},
formKeyValidate: ${formKeyValidate},
buysLoaded: ${buysLoaded},
pendingBuysErrorMsg: ${pendingBuysErrorMsg}
    ''';
  }
}
