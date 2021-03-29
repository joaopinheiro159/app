// To parse this JSON data, do
//
//     final cidadeModel = cidadeModelFromJson(jsonString);

import 'dart:convert';

List<EspecialidadeModel> especialidadeModelFromJson(String str) =>
    List<EspecialidadeModel>.from(
        json.decode(str).map((x) => EspecialidadeModel.fromJson(x)));

String cidadeModelToJson(List<EspecialidadeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EspecialidadeModel {
  EspecialidadeModel({
    this.codEspecialidade,
    this.descricao,
  });

  final String codEspecialidade;
  final String descricao;

  factory EspecialidadeModel.fromJson(Map<String, dynamic> json) =>
      EspecialidadeModel(
        codEspecialidade:
            json["CodEspecialidade"] == null ? null : json["CodEspecialidade"],
        descricao: json["Descricao"] == null ? null : json["Descricao"],
      );

  Map<String, dynamic> toJson() => {
        "CodEspecialidade": codEspecialidade == null ? null : codEspecialidade,
        "Descricao": descricao == null ? null : descricao,
      };

  static List<EspecialidadeModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => EspecialidadeModel.fromJson(item)).toList();
  }

  @override
  String toString() => descricao;
}
