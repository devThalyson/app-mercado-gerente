import 'package:app_mercado_admin/model/categoria.dart';
import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/utils/api_utils/api_helper.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CategorysService {
  static Future<ApiResponse<List<Categoria>>> getCategorys() async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("categorias");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      List listResponse = convert.json.decode(response.body);

      final List<Categoria> categorias = [];

      for (Map<String, dynamic> map in listResponse) {
        Categoria categoria = Categoria.fromJson(map);

        categorias.add(categoria);
      }
      return ApiResponse.ok(categorias);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar categorias.");
    }
  }

  static Future<ApiResponse<bool>> post(Categoria category) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("categorias");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = category.jsonFormat();

      var response = await http.post(url, body: json, headers: headers);

      print("Response status: ${response.statusCode}");

      if (response.statusCode == 201) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Erro ao adicionar categoria. Tente novamente!");
    } catch (error, exception) {
      print(error);
      print(exception);

      return ApiResponse.error("Erro ao adicionar categoria. Tente novamente!");
    }
  }

  static Future<ApiResponse<bool>> put(Categoria category) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("categorias/${category.id}");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = category.jsonFormat();

      var response = await http.put(url, body: json, headers: headers);

      print("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Erro ao atualizar categoria. Tente novamente!");
    } catch (error, exception) {
      print(error);
      print(exception);

      return ApiResponse.error("Erro ao atualizar categoria. Tente novamente!");
    }
  }
}
