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
      'categoriaPlano': categoriaPlano,
      'codBeneficiario': codBeneficiario,
      'codOperadora': codOperadora,
      'codPlano': codPlano,
      'indAtivado': indAtivado,
      'indComplementarDados': indComplementarDados,
      'nomeAssociado': nomeAssociado,
      'nomeOperadora': nomeOperadora,
      'nomePlano': nomePlano,
      'numAssociadoOperadora': numAssociadoOperadora,
      'status': status,
      'tipoBeneficiario': tipoBeneficiario,
      'tipoPlano': tipoPlano,
    };
  }

  factory PlanoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanoModel(
      categoriaPlano: map['categoriaPlano'],
      codBeneficiario: map['codBeneficiario'],
      codOperadora: map['codOperadora'],
      codPlano: map['codPlano'],
      indAtivado: map['indAtivado'],
      indComplementarDados: map['indComplementarDados'],
      nomeAssociado: map['nomeAssociado'],
      nomeOperadora: map['nomeOperadora'],
      nomePlano: map['nomePlano'],
      numAssociadoOperadora: map['numAssociadoOperadora'],
      status: map['status'],
      tipoBeneficiario: map['tipoBeneficiario'],
      tipoPlano: map['tipoPlano'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanoModel.fromJson(String source) =>
      PlanoModel.fromMap(json.decode(source));
}
