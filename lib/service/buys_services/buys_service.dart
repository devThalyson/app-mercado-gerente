import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/model/compra.dart';
import 'package:app_mercado_admin/utils/api_utils/api_helper.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BuysSevice {
  static Future<ApiResponse<List<Compra>>> getBuysByStatus(
      String status) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("compras/status/$status");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      List listResponse = convert.json.decode(response.body);

      final List<Compra> compras = [];

      for (Map<String, dynamic> map in listResponse) {
        Compra compra = Compra.fromJson(map);
        compras.add(compra);
      }
      return ApiResponse.ok(compras);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar compras.");
    }
  }

  static Future<ApiResponse<bool>> put(Compra compra) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("compras/${compra.id}");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = compra.jsonFormat();

      var response = await http.put(url, body: json, headers: headers);

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error(
          "Erro ao atualizar status da compra. Tente novamente!");
    } catch (error, exception) {
      print(error);
      print(exception);
      return ApiResponse.error("Erro! Tente novamente!");
    }
  }
}
