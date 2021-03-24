// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromMap(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromMap(String str) =>
    ChangePasswordModel.fromMap(json.decode(str));

String changePasswordModelToMap(ChangePasswordModel data) =>
    json.encode(data.toMap());

class ChangePasswordModel {
  ChangePasswordModel({
    this.codRetorno,
    this.msgRetorno,
  });

  final int codRetorno;
  final String msgRetorno;

  factory ChangePasswordModel.fromMap(Map<String, dynamic> json) =>
      ChangePasswordModel(
        codRetorno: json["CodRetorno"] == null ? null : json["CodRetorno"],
        msgRetorno: json["MsgRetorno"] == null ? null : json["MsgRetorno"],
      );

  Map<String, dynamic> toMap() => {
        "CodRetorno": codRetorno == null ? null : codRetorno,
        "MsgRetorno": msgRetorno == null ? null : msgRetorno,
      };
}
