// To parse this JSON data, do
//
//     final cidadeModel = cidadeModelFromJson(jsonString);

import 'dart:convert';

List<CidadeModel> cidadeModelFromJson(String str) => List<CidadeModel>.from(
    json.decode(str).map((x) => CidadeModel.fromJson(x)));

String cidadeModelToJson(List<CidadeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CidadeModel {
  CidadeModel({
    this.codCidade,
    this.nome,
  });

  final String codCidade;
  final String nome;

  factory CidadeModel.fromJson(Map<String, dynamic> json) => CidadeModel(
        codCidade: json["CodCidade"] == null ? null : json["CodCidade"],
        nome: json["Nome"] == null ? null : json["Nome"],
      );

  Map<String, dynamic> toJson() => {
        "CodCidade": codCidade == null ? null : codCidade,
        "Nome": nome == null ? null : nome,
      };

  static List<CidadeModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => CidadeModel.fromJson(item)).toList();
  }

  @override
  String toString() => nome;
}
