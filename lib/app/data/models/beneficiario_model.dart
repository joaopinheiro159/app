// To parse this JSON data, do
//
//     final beneficiarioModel = beneficiarioModelFromMap(jsonString);

import 'dart:convert';

BeneficiarioModel beneficiarioModelFromMap(String str) =>
    BeneficiarioModel.fromMap(json.decode(str));

String beneficiarioModelToMap(BeneficiarioModel data) =>
    json.encode(data.toMap());

class BeneficiarioModel {
  BeneficiarioModel({
    this.codRetorno,
    this.msgRetorno,
    this.beneficiario,
  });

  final int codRetorno;
  final dynamic msgRetorno;
  final Beneficiario beneficiario;

  factory BeneficiarioModel.fromMap(Map<String, dynamic> json) =>
      BeneficiarioModel(
        codRetorno: json["CodRetorno"],
        msgRetorno: json["MsgRetorno"],
        beneficiario: Beneficiario.fromMap(json["Beneficiario"]),
      );

  Map<String, dynamic> toMap() => {
        "CodRetorno": codRetorno,
        "MsgRetorno": msgRetorno,
        "Beneficiario": beneficiario.toMap(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'BeneficiarioModel(codRetorno: $codRetorno, msgRetorno: $msgRetorno, beneficiario: $beneficiario)';

  factory BeneficiarioModel.fromJson(String source) =>
      BeneficiarioModel.fromMap(json.decode(source));
}

class Beneficiario {
  Beneficiario({
    this.abrangenciaGeografica,
    this.acomodacaoPlano,
    this.cpf,
    this.cns,
    this.contrato,
    this.dtInclusaoPlano,
    this.dtNascimento,
    this.dtTerminoCpt,
    this.emails,
    this.empresa,
    this.enderecos,
    this.idContratoClasse,
    this.idEntidadeClasse,
    this.idOperadora,
    this.indAns,
    this.inicioVigencia,
    this.linkCarteirinhaFrente,
    this.linkCarteirinhaVerso,
    this.nomeCartao,
    this.nomeEntidade,
    this.nomeMae,
    this.nomePlano,
    this.numeroAssociado,
    this.numeroAssociadoOperadora,
    this.numeroPis,
    this.planoRegulamentado,
    this.registroAns,
    this.segmentacao,
    this.sexo,
    this.status,
    this.telefones,
    this.tipoBeneficiario,
    this.tipoContratacao,
  });

  final String abrangenciaGeografica;
  final String acomodacaoPlano;
  final String cpf;
  final String cns;
  final String contrato;
  final String dtInclusaoPlano;
  final String dtNascimento;
  final dynamic dtTerminoCpt;
  final List<Email> emails;
  final dynamic empresa;
  final List<Endereco> enderecos;
  final String idContratoClasse;
  final String idEntidadeClasse;
  final String idOperadora;
  final String indAns;
  final String inicioVigencia;
  final String linkCarteirinhaFrente;
  final String linkCarteirinhaVerso;
  final String nomeCartao;
  final dynamic nomeEntidade;
  final String nomeMae;
  final String nomePlano;
  final String numeroAssociado;
  final dynamic numeroAssociadoOperadora;
  final dynamic numeroPis;
  final String planoRegulamentado;
  final String registroAns;
  final String segmentacao;
  final String sexo;
  final String status;
  final List<Telefone> telefones;
  final String tipoBeneficiario;
  final String tipoContratacao;

  factory Beneficiario.fromMap(Map<String, dynamic> json) => Beneficiario(
        abrangenciaGeografica: json["AbrangenciaGeografica"],
        acomodacaoPlano: json["AcomodacaoPlano"],
        cpf: json["CPF"],
        cns: json["Cns"],
        contrato: json["Contrato"],
        dtInclusaoPlano: json["DtInclusaoPlano"],
        dtNascimento: json["DtNascimento"],
        dtTerminoCpt: json["DtTerminoCpt"],
        emails: List<Email>.from(json["Emails"].map((x) => Email.fromMap(x))),
        empresa: json["Empresa"],
        enderecos: List<Endereco>.from(
            json["Enderecos"].map((x) => Endereco.fromMap(x))),
        idContratoClasse: json["IdContratoClasse"],
        idEntidadeClasse: json["IdEntidadeClasse"],
        idOperadora: json["IdOperadora"],
        indAns: json["IndANS"],
        inicioVigencia: json["InicioVigencia"],
        linkCarteirinhaFrente: json["LinkCarteirinhaFrente"],
        linkCarteirinhaVerso: json["LinkCarteirinhaVerso"],
        nomeCartao: json["NomeCartao"],
        nomeEntidade: json["NomeEntidade"],
        nomeMae: json["NomeMae"],
        nomePlano: json["NomePlano"],
        numeroAssociado: json["NumeroAssociado"],
        numeroAssociadoOperadora: json["NumeroAssociadoOperadora"],
        numeroPis: json["NumeroPis"],
        planoRegulamentado: json["PlanoRegulamentado"],
        registroAns: json["RegistroANS"],
        segmentacao: json["Segmentacao"],
        sexo: json["Sexo"],
        status: json["Status"],
        telefones: List<Telefone>.from(
            json["Telefones"].map((x) => Telefone.fromMap(x))),
        tipoBeneficiario: json["TipoBeneficiario"],
        tipoContratacao: json["TipoContratacao"],
      );

  Map<String, dynamic> toMap() => {
        "AbrangenciaGeografica": abrangenciaGeografica,
        "AcomodacaoPlano": acomodacaoPlano,
        "CPF": cpf,
        "Cns": cns,
        "Contrato": contrato,
        "DtInclusaoPlano": dtInclusaoPlano,
        "DtNascimento": dtNascimento,
        "DtTerminoCpt": dtTerminoCpt,
        "Emails": List<dynamic>.from(emails.map((x) => x.toMap())),
        "Empresa": empresa,
        "Enderecos": List<dynamic>.from(enderecos.map((x) => x.toMap())),
        "IdContratoClasse": idContratoClasse,
        "IdEntidadeClasse": idEntidadeClasse,
        "IdOperadora": idOperadora,
        "IndANS": indAns,
        "InicioVigencia": inicioVigencia,
        "LinkCarteirinhaFrente": linkCarteirinhaFrente,
        "LinkCarteirinhaVerso": linkCarteirinhaVerso,
        "NomeCartao": nomeCartao,
        "NomeEntidade": nomeEntidade,
        "NomeMae": nomeMae,
        "NomePlano": nomePlano,
        "NumeroAssociado": numeroAssociado,
        "NumeroAssociadoOperadora": numeroAssociadoOperadora,
        "NumeroPis": numeroPis,
        "PlanoRegulamentado": planoRegulamentado,
        "RegistroANS": registroAns,
        "Segmentacao": segmentacao,
        "Sexo": sexo,
        "Status": status,
        "Telefones": List<dynamic>.from(telefones.map((x) => x.toMap())),
        "TipoBeneficiario": tipoBeneficiario,
        "TipoContratacao": tipoContratacao,
      };
}

class Email {
  Email({
    this.codEmail,
    this.email,
  });

  final String codEmail;
  final String email;

  factory Email.fromMap(Map<String, dynamic> json) => Email(
        codEmail: json["CodEmail"],
        email: json["Email"],
      );

  Map<String, dynamic> toMap() => {
        "CodEmail": codEmail,
        "Email": email,
      };
}

class Endereco {
  Endereco({
    this.bairro,
    this.cep,
    this.cidade,
    this.codEndereco,
    this.complemento,
    this.logradouro,
    this.numero,
    this.uf,
  });

  final String bairro;
  final String cep;
  final String cidade;
  final String codEndereco;
  final String complemento;
  final String logradouro;
  final String numero;
  final String uf;

  factory Endereco.fromMap(Map<String, dynamic> json) => Endereco(
        bairro: json["Bairro"],
        cep: json["Cep"],
        cidade: json["Cidade"],
        codEndereco: json["CodEndereco"],
        complemento: json["Complemento"],
        logradouro: json["Logradouro"],
        numero: json["Numero"],
        uf: json["UF"],
      );

  Map<String, dynamic> toMap() => {
        "Bairro": bairro,
        "Cep": cep,
        "Cidade": cidade,
        "CodEndereco": codEndereco,
        "Complemento": complemento,
        "Logradouro": logradouro,
        "Numero": numero,
        "UF": uf,
      };
}

class Telefone {
  Telefone({
    this.codTelefone,
    this.ddd,
    this.numero,
  });

  final String codTelefone;
  final String ddd;
  final String numero;

  factory Telefone.fromMap(Map<String, dynamic> json) => Telefone(
        codTelefone: json["CodTelefone"],
        ddd: json["DDD"],
        numero: json["Numero"],
      );

  Map<String, dynamic> toMap() => {
        "CodTelefone": codTelefone,
        "DDD": ddd,
        "Numero": numero,
      };
}
