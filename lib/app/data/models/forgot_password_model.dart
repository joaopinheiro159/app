// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromMap(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromMap(String str) =>
    ForgotPasswordModel.fromMap(json.decode(str));

String forgotPasswordModelToMap(ForgotPasswordModel data) =>
    json.encode(data.toMap());

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.codRetorno,
    this.msgRetorno,
  });

  final int codRetorno;
  final String msgRetorno;

  factory ForgotPasswordModel.fromMap(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        codRetorno: json["CodRetorno"] == null ? null : json["CodRetorno"],
        msgRetorno: json["MsgRetorno"] == null ? null : json["MsgRetorno"],
      );

  Map<String, dynamic> toMap() => {
        "CodRetorno": codRetorno == null ? null : codRetorno,
        "MsgRetorno": msgRetorno == null ? null : msgRetorno,
      };
}
