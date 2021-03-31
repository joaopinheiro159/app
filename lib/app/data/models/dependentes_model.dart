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
        codRetorno: json["CodRetorno"] == null ? null : json["CodRetorno"],
        msgRetorno: json["MsgRetorno"] == null ? null : json["MsgRetorno"],
        dependente: json["Dependente"] == null
            ? null
            : List<Dependente>.from(
                json["Dependente"].map((x) => Dependente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "CodRetorno": codRetorno == null ? null : codRetorno,
        "MsgRetorno": msgRetorno == null ? null : msgRetorno,
        "Dependente": dependente == null
            ? null
            : List<dynamic>.from(dependente.map((x) => x.toMap())),
      };
}

class Dependente {
  Dependente({
    this.codigoAssociado,
    this.nomeAssociado,
  });

  final String codigoAssociado;
  final String nomeAssociado;

  factory Dependente.fromMap(Map<String, dynamic> json) => Dependente(
        codigoAssociado:
            json["CodigoAssociado"] == null ? null : json["CodigoAssociado"],
        nomeAssociado:
            json["NomeAssociado"] == null ? null : json["NomeAssociado"],
      );

  Map<String, dynamic> toMap() => {
        "CodigoAssociado": codigoAssociado == null ? null : codigoAssociado,
        "NomeAssociado": nomeAssociado == null ? null : nomeAssociado,
      };
}
