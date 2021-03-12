import 'dart:convert';

class PlanoModel {
  String categoriaPlano;
  String codBeneficiario;
  String codOperadora;
  String codPlano;
  bool indAtivado;
  bool indComplementarDados;
  String nomeAssociado;
  String nomeOperadora;
  String nomePlano;
  dynamic numAssociadoOperadora;
  String status;
  String tipoBeneficiario;
  String tipoPlano;

  PlanoModel({
    this.categoriaPlano,
    this.codBeneficiario,
    this.codOperadora,
    this.codPlano,
    this.indAtivado,
    this.indComplementarDados,
    this.nomeAssociado,
    this.nomeOperadora,
    this.nomePlano,
    this.numAssociadoOperadora,
    this.status,
    this.tipoBeneficiario,
    this.tipoPlano,
  });

  Map<String, dynamic> toMap() {
    return {
      'CategoriaPlano': categoriaPlano,
      'CodBeneficiario': codBeneficiario,
      'CodOperadora': codOperadora,
      'CodPlano': codPlano,
      'IndAtivado': indAtivado,
      'IndComplementarDados': indComplementarDados,
      'NomeAssociado': nomeAssociado,
      'NomeOperadora': nomeOperadora,
      'NomePlano': nomePlano,
      'NumAssociadoOperadora': numAssociadoOperadora,
      'Status': status,
      'TipoBeneficiario': tipoBeneficiario,
      'TipoPlano': tipoPlano,
    };
  }

  factory PlanoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanoModel(
      categoriaPlano: map['CategoriaPlano'] ?? '',
      codBeneficiario: map['CodBeneficiario'] ?? '',
      codOperadora: map['CodOperadora'] ?? '',
      codPlano: map['CodPlano'] ?? '',
      indAtivado: map['IndAtivado'] ?? '',
      indComplementarDados: map['IndComplementarDados'] ?? '',
      nomeAssociado: map['NomeAssociado'] ?? '',
      nomeOperadora: map['NomeOperadora'] ?? '',
      nomePlano: map['NomePlano'] ?? '',
      numAssociadoOperadora: map['NumAssociadoOperadora'] ?? '',
      status: map['Status'] ?? '',
      tipoBeneficiario: map['TipoBeneficiario'] ?? '',
      tipoPlano: map['TipoPlano'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanoModel.fromJson(String source) =>
      PlanoModel.fromMap(json.decode(source));
}
