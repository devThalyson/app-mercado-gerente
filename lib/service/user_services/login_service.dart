import 'dart:convert' as convert;
import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/utils/api_utils/api_helper.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<ApiResponse<bool>> login(String email, String senha) async {
    try {
      var stringUrl = ApiHelper().setUrl("login");

      var url = Uri.parse(stringUrl);

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {
        "username": email,
        "password": senha,
      };

      String body = convert.json.encode(params);

      var response = await http.post(url, body: body, headers: headers);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      Map<String, dynamic> mapResponse = convert.json.decode(response.body);

      if (response.statusCode == 200) {
        final cliente = Cliente.fromJson(mapResponse);

        if (cliente.roles!.contains("ROLE_ADMIN")) {
          cliente.save();
          return ApiResponse.ok(true);
        } else {
          return ApiResponse.error("Você não tem permissão de Gerente.");
        }
      }
      return ApiResponse.error("E-mail ou senha incorretos");
    } catch (error, exception) {
      print("erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}
