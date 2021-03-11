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
      'codRetorno': codRetorno,
      'msgRetorno': msgRetorno,
      'menu': menu,
      'planos': planos?.map((x) => x?.toMap())?.toList(),
      'token': token,
      'contaGoogle': contaGoogle,
      'senhaGoogle': senhaGoogle,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      codRetorno: map['codRetorno'],
      msgRetorno: map['msgRetorno'],
      menu: map['menu'],
      planos: List<PlanoModel>.from(
          map['planos']?.map((x) => PlanoModel.fromMap(x))),
      token: map['token'],
      contaGoogle: map['contaGoogle'],
      senhaGoogle: map['senhaGoogle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
