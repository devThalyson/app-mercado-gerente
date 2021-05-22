import 'package:app_mercado_admin/model/produto.dart';
import 'package:app_mercado_admin/utils/drop_down.dart';
import 'dart:convert' as convert;

class Categoria extends DropDownItem {
  int? id;
  String? nome;
  String? imagem;
  int? ativa;
  List<Produto>? produtos;

  Categoria({this.id, this.nome, this.produtos, this.imagem});

  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
    ativa = json['ativa'];
    if (json['produtos'] != null) {
      produtos = [];
      json['produtos'].forEach(
        (v) {
          produtos!.add(new Produto.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['ativa'] = this.ativa;
    if (this.produtos != null) {
      data['produtos'] = this
          .produtos!
          .map(
            (v) => v.toJson(),
          )
          .toList();
    }
    return data;
  }

  @override
  String text() {
    return nome!;
  }

  String jsonFormat() {
    String json = convert.json.encode(toJson());
    return json;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Categoria && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
