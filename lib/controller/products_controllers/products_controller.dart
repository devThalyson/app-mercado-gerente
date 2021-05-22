import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/service/products_services/products_service.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  CategorysController categorysController = CategorysController();

  @observable
  List<Produto> products = ObservableList<Produto>();

  @observable
  List<Produto>? cachedProducts;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController controllerImage = TextEditingController();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  TextEditingController controllerDescription = TextEditingController();

  @observable
  TextEditingController controllerWeight = TextEditingController();

  @observable
  TextEditingController controllerMinimumSale = TextEditingController();

  @observable
  TextEditingController controllerPrice = TextEditingController();

  @observable
  int metricProduct = 0;

  @observable
  int metricProductUpdate = 0;

  @observable
  int productDisponibility = 0;

  @observable
  GlobalKey<FormState> formKeyUpdate = GlobalKey<FormState>();

  @observable
  TextEditingController controllerImageUpdate = TextEditingController();

  @observable
  TextEditingController controllerNameUpdate = TextEditingController();

  @observable
  TextEditingController controllerDescriptionUpdate = TextEditingController();

  @observable
  TextEditingController controllerWeightUpdate = TextEditingController();

  @observable
  TextEditingController controllerMinimumSaleUpdate = TextEditingController();

  @observable
  TextEditingController controllerPriceUpdate = TextEditingController();

  @observable
  bool productsLoaded = false;

  @observable
  bool progress = false;

  @observable
  bool progressAddProduct = false;

  @observable
  bool progressUpdateProduct = false;

  @observable
  bool? formUpdateProductValidate;

  @observable
  bool? formAddProductValidate;

  @observable
  bool searchedProducts = false;

  @observable
  String errorMsg = "";

  @observable
  String addProductMessage = "";

  @observable
  String updateProductMessage = "";

  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  setCategoryController(CategorysController newCategorysController) {
    categorysController = newCategorysController;
  }

  @action
  Future<dynamic> getProducts() async {
    searchedProducts = false;
    progress = true;
    ApiResponse response = await ProductsService.getProducts();
    if (response.result != null) {
      products = response.result;
      progress = false;
      productsLoaded = true;
      print("Carregando produtos!");
    } else {
      errorMsg = response.msg!;
      progress = false;
    }
  }

  @action
  searchProducts(String search) {
    searchedProducts = true;
    cachedProducts = products;
    cachedProducts = cachedProducts!
        .where(
          (element) => element.nome!.toLowerCase().contains(
                search.toLowerCase(),
              ),
        )
        .toList();
  }

  @action
  setRadioMetricProduct(int value) {
    metricProduct = value;
  }

  @action
  setRadioMetricProductUpdate(int value) {
    metricProductUpdate = value;
  }

  @action
  setRadioProductDisponibility(int value) {
    productDisponibility = value;
    print(productDisponibility);
  }

  @action
  formAddProductCheck() {
    formAddProductValidate = formKey.currentState!.validate();
  }

  @action
  formUpdateProductCheck() {
    formUpdateProductValidate = formKeyUpdate.currentState!.validate();
  }

  @action
  getMetricProduct(int value) {
    switch (value) {
      case 0:
        return "KG";
      case 1:
        return "G";
      case 2:
        return "L";
      case 3:
        return "ML";
      case 4:
        return "UNI";
    }
  }

  @action
  getMetricProductUpdate(Produto produto) {
    switch (produto.medida) {
      case "KG":
        return 0;
      case "G":
        return 1;
      case "L":
        return 2;
      case "ML":
        return 3;
      case "UNI":
        return 4;
    }
  }

  @action
  resetAllFields() {
    controllerImage.text = "";
    controllerName.text = "";
    controllerDescription.text = "";

    metricProduct = 0;

    controllerWeight.text = "";
    controllerMinimumSale.text = "";
    controllerPrice.text = "";
  }

  @action
  fillUpdateFields(Produto produto) {
    controllerImageUpdate.text = produto.imagem!;
    controllerNameUpdate.text = produto.nome!;
    controllerDescriptionUpdate.text = produto.descricao!;

    categorysController.categoryUpdate = produto.categoria;

    metricProductUpdate = getMetricProductUpdate(produto);

    controllerWeightUpdate.text = produto.peso.toString().replaceAll(
        RegExp(
          r'[A-Z]',
        ),
        "");
    controllerMinimumSaleUpdate.text = produto.minimoVenda.toString();
    controllerPriceUpdate.text = produto.preco.toString();

    productDisponibility = produto.indisponivel!;
  }

  @action
  Future<dynamic> addProduct() async {
    Produto produto = Produto();

    //produto.imagem = controllerImage.text;
    produto.imagem =
        "https://assets.instabuy.com.br/ib.item.image.big/b-e0f9dc8f93d1413d93d29a498c846fd1.jpeg";
    produto.nome = controllerName.text;
    produto.descricao = controllerDescription.text;

    produto.categoria = categorysController.category;

    produto.medida = getMetricProduct(metricProductUpdate);
    produto.minimoVenda = double.parse(controllerMinimumSale.text);
    produto.peso = produto.medida != "UNI"
        ? "${controllerWeight.text}${produto.medida}"
        : "${produto.minimoVenda} UNI";

    produto.preco = double.parse(controllerPrice.text);

    progressAddProduct = true;
    ApiResponse response = await ProductsService.post(produto);
    progressAddProduct = false;

    if (response.ok == true) {
      addProductMessage = "Produto adicionado com sucesso!";
      resetAllFields();
      getProducts();
    } else {
      addProductMessage = response.msg!;
    }
  }

  @action
  Future<dynamic> updateProduct(Produto produto) async {
    produto.imagem = controllerImageUpdate.text;

    produto.nome = controllerNameUpdate.text;
    produto.descricao = controllerDescriptionUpdate.text;

    produto.categoria = categorysController.categoryUpdate;

    produto.medida = getMetricProduct(metricProductUpdate);
    produto.minimoVenda = double.parse(controllerMinimumSaleUpdate.text);
    produto.peso = produto.medida != "UNI"
        ? "${controllerWeightUpdate.text}${produto.medida}"
        : "${produto.minimoVenda} UNI";

    produto.preco = double.parse(controllerPriceUpdate.text);

    produto.indisponivel = productDisponibility;

    progressUpdateProduct = true;
    ApiResponse response = await ProductsService.put(produto);
    progressUpdateProduct = false;

    if (response.ok == true) {
      updateProductMessage = "Produto atualizado com sucesso!";
      getProducts();
    } else {
      updateProductMessage = response.msg!;
    }
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
