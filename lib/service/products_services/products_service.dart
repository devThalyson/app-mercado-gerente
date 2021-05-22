import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/api_utils/api_helper.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductsService {
  static Future<ApiResponse<List<Produto>>> getProducts() async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("produtos");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      List listResponse = convert.json.decode(response.body);

      final List<Produto> produtos = [];

      for (Map<String, dynamic> map in listResponse) {
        Produto produto = Produto.fromJson(map);
        produtos.add(produto);
      }
      return ApiResponse.ok(produtos);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar produtos.");
    }
  }

  static Future<ApiResponse<bool>> post(Produto produto) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("produtos");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = produto.jsonFormat();

      var response = await http.post(url, body: json, headers: headers);

      print("Response status: ${response.statusCode}");

      if (response.statusCode == 201) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Erro ao adicionar produto. Tente novamente!");
    } catch (error, exception) {
      print(error);
      print(exception);

      return ApiResponse.error("Erro ao adicionar produto. Tente novamente!");
    }
  }

  static Future<ApiResponse<bool>> put(Produto produto) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      print(produto.indisponivel);

      String stringUrl = ApiHelper().setUrl("produtos/${produto.id}");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = produto.jsonFormat();

      var response = await http.put(url, body: json, headers: headers);

      print("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }
      return ApiResponse.error("Erro ao atualizar produto. Tente novamente!");
    } catch (error, exception) {
      print(error);
      print(exception);
      return ApiResponse.error("Erro ao atualizar produto. Tente novamente!");
    }
  }
}
