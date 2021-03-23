// To parse this JSON data, do
//
//     final dependentesModel = dependentesModelFromMap(jsonString);

import 'dart:convert';

DependentesModel dependentesModelFromMap(String str) =>
    DependentesModel.fromMap(json.decode(str));

String dependentesModelToMap(DependentesModel data) =>
    json.encode(data.toMap());

class DependentesModel {
  DependentesModel({
    this.codRetorno,
    this.msgRetorno,
    this.dependente,
  });

  final int codRetorno;
  final String msgRetorno;
  final List<Dependente> dependente;

  factory DependentesModel.fromMap(Map<String, dynamic> json) =>
      DependentesModel(
        codRetorno: json["CodRetorno"],
        msgRetorno: json["MsgRetorno"],
        dependente: List<Dependente>.from(
            json["Dependente"].map((x) => Dependente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "CodRetorno": codRetorno,
        "MsgRetorno": msgRetorno,
        "Dependente": List<dynamic>.from(dependente.map((x) => x.toMap())),
      };

  String toJson() => json.encode(toMap());

  factory DependentesModel.fromJson(String source) =>
      DependentesModel.fromMap(json.decode(source));
}

class Dependente {
  Dependente({
    this.codigoAssociado,
    this.nomeAssociado,
  });

  final String codigoAssociado;
  final String nomeAssociado;

  factory Dependente.fromMap(Map<String, dynamic> json) => Dependente(
        codigoAssociado: json["CodigoAssociado"],
        nomeAssociado: json["NomeAssociado"],
      );

  Map<String, dynamic> toMap() => {
        "CodigoAssociado": codigoAssociado,
        "NomeAssociado": nomeAssociado,
      };
}
