import 'dart:convert' as convert;

import 'package:app_mercado_admin/utils/prefs.dart';

class Cliente {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? endereco;
  String? senha;
  String? token;

  List<String>? roles;

  Cliente(
      {this.id,
      this.nome,
      this.email,
      this.telefone,
      this.endereco,
      this.senha,
      this.token,
      this.roles});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    senha = json['senha'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson({bool? withRoles = true}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['endereco'] = this.endereco;
    data['senha'] = this.senha;
    data['token'] = this.token;
    if (withRoles == true) {
      data['roles'] = this.roles;
    }

    return data;
  }

  static void clear() {
    Prefs.setString("cliente.prefs", "");
  }

  String jsonFormat() {
    String json = convert.json.encode(toJson(withRoles: false));
    return json;
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("cliente.prefs", json);
  }

  static Future<Cliente?> get() async {
    String json = await Prefs.getString("cliente.prefs");

    if (json.isEmpty) {
      return null;
    }

    Map<String, dynamic> map = convert.json.decode(json);

    Cliente cliente = Cliente.fromJson(map);
    return cliente;
  }

  @override
  String toString() {
    return "Cliente{Email: $email, nome: $nome, senha: $senha, token: $token}";
  }
}
