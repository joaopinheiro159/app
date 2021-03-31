// To parse this JSON data, do
//
//     final prestadorModel = prestadorModelFromJson(jsonString);

import 'dart:convert';

List<PrestadorModel> prestadorModelFromJson(String str) =>
    List<PrestadorModel>.from(
        json.decode(str).map((x) => PrestadorModel.fromJson(x)));

String prestadorModelToJson(List<PrestadorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrestadorModel {
  PrestadorModel({
    this.codPrestador,
    this.crm,
    this.distancia,
    this.email,
    this.endereco,
    this.latitude,
    this.longitude,
    this.nome,
    this.qualificacao,
    this.qualificacoes,
    this.telefones,
    this.tipoPessoa,
    this.tipoPrestador,
    this.txtHorarios,
    this.txtReferencia,
  });

  final String codPrestador;
  final Crm crm;
  final dynamic distancia;
  final dynamic email;
  final String endereco;
  final dynamic latitude;
  final dynamic longitude;
  final String nome;
  final List<dynamic> qualificacao;
  final dynamic qualificacoes;
  final List<Telefone> telefones;
  final dynamic tipoPessoa;
  final String tipoPrestador;
  final dynamic txtHorarios;
  final dynamic txtReferencia;

  factory PrestadorModel.fromJson(Map<String, dynamic> json) => PrestadorModel(
        codPrestador:
            json["CodPrestador"] == null ? null : json["CodPrestador"],
        crm: json["Crm"] == null ? null : Crm.fromJson(json["Crm"]),
        distancia: json["Distancia"],
        email: json["Email"],
        endereco: json["Endereco"] == null ? null : json["Endereco"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        nome: json["Nome"] == null ? null : json["Nome"],
        qualificacao: json["Qualificacao"] == null
            ? null
            : List<dynamic>.from(json["Qualificacao"].map((x) => x)),
        qualificacoes: json["Qualificacoes"],
        telefones: json["Telefones"] == null
            ? null
            : List<Telefone>.from(
                json["Telefones"].map((x) => Telefone.fromJson(x))),
        tipoPessoa: json["TipoPessoa"],
        tipoPrestador:
            json["TipoPrestador"] == null ? null : json["TipoPrestador"],
        txtHorarios: json["TxtHorarios"],
        txtReferencia: json["TxtReferencia"],
      );

  Map<String, dynamic> toJson() => {
        "CodPrestador": codPrestador == null ? null : codPrestador,
        "Crm": crm == null ? null : crm.toJson(),
        "Distancia": distancia,
        "Email": email,
        "Endereco": endereco == null ? null : endereco,
        "Latitude": latitude,
        "Longitude": longitude,
        "Nome": nome == null ? null : nome,
        "Qualificacao": qualificacao == null
            ? null
            : List<dynamic>.from(qualificacao.map((x) => x)),
        "Qualificacoes": qualificacoes,
        "Telefones": telefones == null
            ? null
            : List<dynamic>.from(telefones.map((x) => x.toJson())),
        "TipoPessoa": tipoPessoa,
        "TipoPrestador": tipoPrestador == null ? null : tipoPrestador,
        "TxtHorarios": txtHorarios,
        "TxtReferencia": txtReferencia,
      };
}

class Crm {
  Crm({
    this.numCrm,
    this.siglaConselho,
    this.siglaUfConselho,
    this.tipoPessoa,
  });

  final String numCrm;
  final String siglaConselho;
  final String siglaUfConselho;
  final String tipoPessoa;

  factory Crm.fromJson(Map<String, dynamic> json) => Crm(
        numCrm: json["NumCrm"] == null ? null : json["NumCrm"],
        siglaConselho:
            json["SiglaConselho"] == null ? null : json["SiglaConselho"],
        siglaUfConselho:
            json["SiglaUfConselho"] == null ? null : json["SiglaUfConselho"],
        tipoPessoa: json["TipoPessoa"] == null ? null : json["TipoPessoa"],
      );

  Map<String, dynamic> toJson() => {
        "NumCrm": numCrm == null ? null : numCrm,
        "SiglaConselho": siglaConselho == null ? null : siglaConselho,
        "SiglaUfConselho": siglaUfConselho == null ? null : siglaUfConselho,
        "TipoPessoa": tipoPessoa == null ? null : tipoPessoa,
      };
}

class Telefone {
  Telefone({
    this.ddd,
    this.numero,
  });

  final String ddd;
  final String numero;

  factory Telefone.fromJson(Map<String, dynamic> json) => Telefone(
        ddd: json["Ddd"] == null ? null : json["Ddd"],
        numero: json["Numero"] == null ? null : json["Numero"],
      );

  Map<String, dynamic> toJson() => {
        "Ddd": ddd == null ? null : ddd,
        "Numero": numero == null ? null : numero,
      };
}
