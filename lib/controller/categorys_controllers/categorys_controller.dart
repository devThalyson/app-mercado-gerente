import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/service/categorys_services/categorys_service.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'categorys_controller.g.dart';

class CategorysController = _CategorysControllerBase with _$CategorysController;

abstract class _CategorysControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  List<Categoria> categorys = ObservableList<Categoria>();

  @observable
  Categoria? category;

  @observable
  Categoria? categoryUpdate;

  @observable
  GlobalKey<FormState> formKeyAddCategory = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formKeyUpdateCategory = GlobalKey<FormState>();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerimage = TextEditingController();

  @observable
  TextEditingController controllerNameUpdate = TextEditingController();

  @observable
  TextEditingController controllerImageUpdate = TextEditingController();

  @observable
  bool progress = false;

  @observable
  bool progressAddCategory = false;

  @observable
  bool progressUpdateCategory = false;

  @observable
  bool categorysLoaded = false;

  @observable
  bool? formKeyAddCategoryValidate;

  @observable
  bool? formKeyUpdateCategoryValidate;

  @observable
  String errorMsg = "";

  @observable
  String msgAddCategory = "";

  @observable
  String msgUpdateCategory = "";

  @observable
  int radioCategoryAtive = 0;

  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  Future<dynamic> getCategorys() async {
    if (categorysLoaded == false) {
      progress = true;
      ApiResponse response = await CategorysService.getCategorys();
      if (response.result != null) {
        categorys = response.result;
        progress = false;
        categorysLoaded = true;
      } else {
        errorMsg = response.msg!;
        progress = false;
      }
    }
  }

  @action
  Future<dynamic> addCategory() async {
    Categoria categoria = Categoria();

    //categoria.imagem = controllerImage.text;
    categoria.imagem =
        "https://assets.instabuy.com.br/ib.item.image.big/b-e0f9dc8f93d1413d93d29a498c846fd1.jpeg";
    categoria.nome = controllerName.text;

    progressAddCategory = true;
    ApiResponse response = await CategorysService.post(categoria);
    progressAddCategory = false;

    if (response.ok == true) {
      msgAddCategory = "Categoria adicionada com sucesso!";
      resetAllFields();
      categorysLoaded = false;
      getCategorys();
    } else {
      msgAddCategory = response.msg!;
    }
  }

  @action
  Future<dynamic> updateCategory(Categoria categoria) async {
    //categoria.imagem = controllerImage.text;
    categoria.imagem = controllerImageUpdate.text;

    categoria.nome = controllerNameUpdate.text;

    categoria.ativa = radioCategoryAtive;

    progressUpdateCategory = true;
    ApiResponse response = await CategorysService.put(categoria);
    progressUpdateCategory = false;

    if (response.ok == true) {
      msgUpdateCategory = "Categoria atualizada com sucesso!";
      categorysLoaded = false;
      getCategorys();
    } else {
      msgUpdateCategory = response.msg!;
    }
  }

  @action
  changeRadioCategoryAtive(int value) {
    radioCategoryAtive = value;
  }

  @action
  validateFormAddCategory() {
    formKeyAddCategoryValidate = formKeyAddCategory.currentState!.validate();
  }

  @action
  validateFormUpdateCategory() {
    formKeyUpdateCategoryValidate =
        formKeyUpdateCategory.currentState!.validate();
  }

  @action
  resetAllFields() {
    controllerName.text = "";
    controllerimage.text = "";
  }

  @action
  fillAllFields(Categoria categoria) {
    controllerNameUpdate.text = categoria.nome!;
    controllerImageUpdate.text = categoria.imagem!;
    radioCategoryAtive = categoria.ativa!;
  }

  @action
  changeCategory(Categoria categoria) {
    category = categoria;
  }

  @action
  changeCategoryUpdate(Categoria categoria) {
    categoryUpdate = categoria;
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
