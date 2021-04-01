// To parse this JSON data, do
//
//     final boletoModel = boletoModelFromJson(jsonString);

import 'dart:convert';

List<BoletoModel> boletoModelFromJson(String str) => List<BoletoModel>.from(
    json.decode(str).map((x) => BoletoModel.fromJson(x)));

String boletoModelToJson(List<BoletoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BoletoModel {
  BoletoModel({
    this.codBoleto,
    this.competencia,
    this.dataVencimento,
    this.dataVencimentoOriginal,
    this.descSituacao,
    this.diasVencido,
    this.isAlteracaoValor,
    this.isDebitoAutomatico,
    this.isNotificacao,
    this.linhaDigitavel,
    this.numFatura,
    this.pagoEm,
    this.status,
    this.valAtualizado,
    this.valor,
  });

  final String codBoleto;
  final String competencia;
  final String dataVencimento;
  final dynamic dataVencimentoOriginal;
  final String descSituacao;
  final String diasVencido;
  final bool isAlteracaoValor;
  final bool isDebitoAutomatico;
  final bool isNotificacao;
  final String linhaDigitavel;
  final String numFatura;
  final String pagoEm;
  final String status;
  final String valAtualizado;
  final String valor;

  factory BoletoModel.fromJson(Map<String, dynamic> json) => BoletoModel(
        codBoleto: json["CodBoleto"] == null ? null : json["CodBoleto"],
        competencia: json["Competencia"] == null ? null : json["Competencia"],
        dataVencimento:
            json["DataVencimento"] == null ? null : json["DataVencimento"],
        dataVencimentoOriginal: json["DataVencimentoOriginal"],
        descSituacao:
            json["DescSituacao"] == null ? null : json["DescSituacao"],
        diasVencido: json["DiasVencido"] == null ? null : json["DiasVencido"],
        isAlteracaoValor:
            json["IsAlteracaoValor"] == null ? null : json["IsAlteracaoValor"],
        isDebitoAutomatico: json["IsDebitoAutomatico"] == null
            ? null
            : json["IsDebitoAutomatico"],
        isNotificacao:
            json["IsNotificacao"] == null ? null : json["IsNotificacao"],
        linhaDigitavel:
            json["LinhaDigitavel"] == null ? null : json["LinhaDigitavel"],
        numFatura: json["NumFatura"] == null ? null : json["NumFatura"],
        pagoEm: json["PagoEm"] == null ? null : json["PagoEm"],
        status: json["Status"] == null ? null : json["Status"],
        valAtualizado:
            json["ValAtualizado"] == null ? null : json["ValAtualizado"],
        valor: json["Valor"] == null ? null : json["Valor"],
      );

  Map<String, dynamic> toJson() => {
        "CodBoleto": codBoleto == null ? null : codBoleto,
        "Competencia": competencia == null ? null : competencia,
        "DataVencimento": dataVencimento == null ? null : dataVencimento,
        "DataVencimentoOriginal": dataVencimentoOriginal,
        "DescSituacao": descSituacao == null ? null : descSituacao,
        "DiasVencido": diasVencido == null ? null : diasVencido,
        "IsAlteracaoValor": isAlteracaoValor == null ? null : isAlteracaoValor,
        "IsDebitoAutomatico":
            isDebitoAutomatico == null ? null : isDebitoAutomatico,
        "IsNotificacao": isNotificacao == null ? null : isNotificacao,
        "LinhaDigitavel": linhaDigitavel == null ? null : linhaDigitavel,
        "NumFatura": numFatura == null ? null : numFatura,
        "PagoEm": pagoEm == null ? null : pagoEm,
        "Status": status == null ? null : status,
        "ValAtualizado": valAtualizado == null ? null : valAtualizado,
        "Valor": valor == null ? null : valor,
      };
}
