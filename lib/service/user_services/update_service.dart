import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/utils/api_utils/api_helper.dart';
import 'package:app_mercado_admin/utils/api_utils/api_response.dart';
import 'package:dbcrypt/dbcrypt.dart';

import 'package:http/http.dart' as http;

class UpdateService {
  static Future<ApiResponse<bool>> put(
      {String? endereco, String? email, String? senha}) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      if (endereco != null) {
        cliente.endereco = endereco;
      }
      if (email != null) {
        cliente.email = email;
      }
      if (senha != null) {
        var hashSenha = DBCrypt().hashpw(senha, DBCrypt().gensalt());
        cliente.senha = hashSenha;
      }

      String stringUrl = ApiHelper().setUrl("clientes/${cliente.id}");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String json = cliente.jsonFormat();

      var response = await http.put(url, body: json, headers: headers);

      if (response.statusCode == 200) {
        Cliente.clear();
        cliente.save();
        return ApiResponse.ok(true);
      }

      print(response.body);

      return ApiResponse.error("Erro ao atualizar dados.");
    } catch (error, exception) {
      print(error);
      print(exception);
      return ApiResponse.error("Erro! Tente novamente!");
    }
  }
}
