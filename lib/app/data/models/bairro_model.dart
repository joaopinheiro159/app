// To parse this JSON data, do
//
//     final cidadeModel = cidadeModelFromJson(jsonString);

import 'dart:convert';

List<BairroModel> BairroModelFromJson(String str) => List<BairroModel>.from(
    json.decode(str).map((x) => BairroModel.fromJson(x)));

String bairroModelToJson(List<BairroModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BairroModel {
  BairroModel({
    this.codBairro,
    this.nome,
  });

  final String codBairro;
  final String nome;

  factory BairroModel.fromJson(Map<String, dynamic> json) => BairroModel(
        codBairro: json["CodBairro"] == null ? null : json["CodBairro"],
        nome: json["Nome"] == null ? null : json["Nome"],
      );

  Map<String, dynamic> toJson() => {
        "CodCidade": codBairro == null ? null : codBairro,
        "Nome": nome == null ? null : nome,
      };

  static List<BairroModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => BairroModel.fromJson(item)).toList();
  }

  @override
  String toString() => nome;
}
