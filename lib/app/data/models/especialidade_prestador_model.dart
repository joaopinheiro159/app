// To parse this JSON data, do
//
//     final especialidadePrestadorModel = especialidadePrestadorModelFromJson(jsonString);

import 'dart:convert';

List<EspecialidadePrestadorModel> especialidadePrestadorModelFromJson(
        String str) =>
    List<EspecialidadePrestadorModel>.from(
        json.decode(str).map((x) => EspecialidadePrestadorModel.fromJson(x)));

String especialidadePrestadorModelToJson(
        List<EspecialidadePrestadorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EspecialidadePrestadorModel {
  EspecialidadePrestadorModel({
    this.codigoEspecialidade,
    this.descricao,
  });

  final String codigoEspecialidade;
  final String descricao;

  factory EspecialidadePrestadorModel.fromJson(Map<String, dynamic> json) =>
      EspecialidadePrestadorModel(
        codigoEspecialidade: json["CodigoEspecialidade"] == null
            ? null
            : json["CodigoEspecialidade"],
        descricao: json["Descricao"] == null ? null : json["Descricao"],
      );

  Map<String, dynamic> toJson() => {
        "CodigoEspecialidade":
            codigoEspecialidade == null ? null : codigoEspecialidade,
        "Descricao": descricao == null ? null : descricao,
      };
}
