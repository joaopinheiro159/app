import 'dart:convert';

import 'plano_model.dart';

class UserModel {
  int codRetorno;
  String msgRetorno;
  dynamic menu;
  List<PlanoModel> planos;
  String token;
  dynamic contaGoogle;
  dynamic senhaGoogle;

  UserModel({
    this.codRetorno,
    this.msgRetorno,
    this.menu,
    this.planos,
    this.token,
    this.contaGoogle,
    this.senhaGoogle,
  });

  Map<String, dynamic> toMap() {
    return {
      'CodRetorno': codRetorno,
      'MsgRetorno': msgRetorno,
      'Menu': menu,
      'Planos': planos?.map((x) => x?.toMap())?.toList(),
      'Token': token,
      'contaGoogle': contaGoogle,
      'senhaGoogle': senhaGoogle,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      codRetorno: map['CodRetorno'],
      msgRetorno: map['MsgRetorno'],
      menu: map['Menu'],
      planos: List<PlanoModel>.from(
          map['Planos']?.map((x) => PlanoModel.fromMap(x)) ?? const []),
      token: map['Token'],
      contaGoogle: map['contaGoogle'],
      senhaGoogle: map['senhaGoogle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
