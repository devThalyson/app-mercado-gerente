// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuController on _MenuControllerBase, Store {
  final _$clienteAtom = Atom(name: '_MenuControllerBase.cliente');

  @override
  Cliente? get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(Cliente? value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$emailFormKeyAtom = Atom(name: '_MenuControllerBase.emailFormKey');

  @override
  GlobalKey<FormState> get emailFormKey {
    _$emailFormKeyAtom.reportRead();
    return super.emailFormKey;
  }

  @override
  set emailFormKey(GlobalKey<FormState> value) {
    _$emailFormKeyAtom.reportWrite(value, super.emailFormKey, () {
      super.emailFormKey = value;
    });
  }

  final _$passwordFormKeyAtom =
      Atom(name: '_MenuControllerBase.passwordFormKey');

  @override
  GlobalKey<FormState> get passwordFormKey {
    _$passwordFormKeyAtom.reportRead();
    return super.passwordFormKey;
  }

  @override
  set passwordFormKey(GlobalKey<FormState> value) {
    _$passwordFormKeyAtom.reportWrite(value, super.passwordFormKey, () {
      super.passwordFormKey = value;
    });
  }

  final _$actualEmailControllerAtom =
      Atom(name: '_MenuControllerBase.actualEmailController');

  @override
  TextEditingController get actualEmailController {
    _$actualEmailControllerAtom.reportRead();
    return super.actualEmailController;
  }

  @override
  set actualEmailController(TextEditingController value) {
    _$actualEmailControllerAtom.reportWrite(value, super.actualEmailController,
        () {
      super.actualEmailController = value;
    });
  }

  final _$newEmailControllerAtom =
      Atom(name: '_MenuControllerBase.newEmailController');

  @override
  TextEditingController get newEmailController {
    _$newEmailControllerAtom.reportRead();
    return super.newEmailController;
  }

  @override
  set newEmailController(TextEditingController value) {
    _$newEmailControllerAtom.reportWrite(value, super.newEmailController, () {
      super.newEmailController = value;
    });
  }

  final _$repeatNewEmailControllerAtom =
      Atom(name: '_MenuControllerBase.repeatNewEmailController');

  @override
  TextEditingController get repeatNewEmailController {
    _$repeatNewEmailControllerAtom.reportRead();
    return super.repeatNewEmailController;
  }

  @override
  set repeatNewEmailController(TextEditingController value) {
    _$repeatNewEmailControllerAtom
        .reportWrite(value, super.repeatNewEmailController, () {
      super.repeatNewEmailController = value;
    });
  }

  final _$newPasswordControllerAtom =
      Atom(name: '_MenuControllerBase.newPasswordController');

  @override
  TextEditingController get newPasswordController {
    _$newPasswordControllerAtom.reportRead();
    return super.newPasswordController;
  }

  @override
  set newPasswordController(TextEditingController value) {
    _$newPasswordControllerAtom.reportWrite(value, super.newPasswordController,
        () {
      super.newPasswordController = value;
    });
  }

  final _$repeatNewPasswordControllerAtom =
      Atom(name: '_MenuControllerBase.repeatNewPasswordController');

  @override
  TextEditingController get repeatNewPasswordController {
    _$repeatNewPasswordControllerAtom.reportRead();
    return super.repeatNewPasswordController;
  }

  @override
  set repeatNewPasswordController(TextEditingController value) {
    _$repeatNewPasswordControllerAtom
        .reportWrite(value, super.repeatNewPasswordController, () {
      super.repeatNewPasswordController = value;
    });
  }

  final _$emailMsgAtom = Atom(name: '_MenuControllerBase.emailMsg');

  @override
  String get emailMsg {
    _$emailMsgAtom.reportRead();
    return super.emailMsg;
  }

  @override
  set emailMsg(String value) {
    _$emailMsgAtom.reportWrite(value, super.emailMsg, () {
      super.emailMsg = value;
    });
  }

  final _$passwordMsgAtom = Atom(name: '_MenuControllerBase.passwordMsg');

  @override
  String get passwordMsg {
    _$passwordMsgAtom.reportRead();
    return super.passwordMsg;
  }

  @override
  set passwordMsg(String value) {
    _$passwordMsgAtom.reportWrite(value, super.passwordMsg, () {
      super.passwordMsg = value;
    });
  }

  final _$emailFormValidateAtom =
      Atom(name: '_MenuControllerBase.emailFormValidate');

  @override
  bool? get emailFormValidate {
    _$emailFormValidateAtom.reportRead();
    return super.emailFormValidate;
  }

  @override
  set emailFormValidate(bool? value) {
    _$emailFormValidateAtom.reportWrite(value, super.emailFormValidate, () {
      super.emailFormValidate = value;
    });
  }

  final _$passwordFormValidateAtom =
      Atom(name: '_MenuControllerBase.passwordFormValidate');

  @override
  bool? get passwordFormValidate {
    _$passwordFormValidateAtom.reportRead();
    return super.passwordFormValidate;
  }

  @override
  set passwordFormValidate(bool? value) {
    _$passwordFormValidateAtom.reportWrite(value, super.passwordFormValidate,
        () {
      super.passwordFormValidate = value;
    });
  }

  final _$progressAtom = Atom(name: '_MenuControllerBase.progress');

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

  final _$getClientAsyncAction = AsyncAction('_MenuControllerBase.getClient');

  @override
  Future getClient() {
    return _$getClientAsyncAction.run(() => super.getClient());
  }

  final _$updateClientEmailAsyncAction =
      AsyncAction('_MenuControllerBase.updateClientEmail');

  @override
  Future<dynamic> updateClientEmail() {
    return _$updateClientEmailAsyncAction.run(() => super.updateClientEmail());
  }

  final _$updateClientPasswordAsyncAction =
      AsyncAction('_MenuControllerBase.updateClientPassword');

  @override
  Future updateClientPassword() {
    return _$updateClientPasswordAsyncAction
        .run(() => super.updateClientPassword());
  }

  final _$_MenuControllerBaseActionController =
      ActionController(name: '_MenuControllerBase');

  @override
  dynamic clearCachedClient() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.clearCachedClient');
    try {
      return super.clearCachedClient();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearEmailFields() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.clearEmailFields');
    try {
      return super.clearEmailFields();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPasswordFields() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.clearPasswordFields');
    try {
      return super.clearPasswordFields();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkEmailFormValidate() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.checkEmailFormValidate');
    try {
      return super.checkEmailFormValidate();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkPasswordFormValidate() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.checkPasswordFormValidate');
    try {
      return super.checkPasswordFormValidate();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cliente: ${cliente},
emailFormKey: ${emailFormKey},
passwordFormKey: ${passwordFormKey},
actualEmailController: ${actualEmailController},
newEmailController: ${newEmailController},
repeatNewEmailController: ${repeatNewEmailController},
newPasswordController: ${newPasswordController},
repeatNewPasswordController: ${repeatNewPasswordController},
emailMsg: ${emailMsg},
passwordMsg: ${passwordMsg},
emailFormValidate: ${emailFormValidate},
passwordFormValidate: ${passwordFormValidate},
progress: ${progress}
    ''';
  }
}
