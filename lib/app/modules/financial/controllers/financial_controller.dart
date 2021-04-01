import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/boleto_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancialController extends GetxController {
  RxString _beneficiarioEmail = ''.obs;
  final emailController = new TextEditingController();

  RxString get beneficiarioEmail => _beneficiarioEmail;

  @override
  void onInit() {
    super.onInit();
    // boletosEmAberto();
  }

  @override
  void onReady() {
    super.onReady();
    getUserEmail();
  }

  @override
  void onClose() {}

  Future<void> getUserEmail() async {
    final sp = await SharedPreferences.getInstance();

    final beneficiario =
        BeneficiarioModel.fromJson(sp.getString('beneficiario'));

    final email = beneficiario.beneficiario.emails[0].email;

    _beneficiarioEmail(email);
  }

  Future<List<BoletoModel>> boletosEmAberto() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
      'authorization': 'Bearer ${userLogged.token}'
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Cobranca/${userLogged.planos[0].codBeneficiario}/boletos?ind_a_vencer=S&ind_vencidos=S&ind_pagos=S",
        options: Options(headers: headers));

    if (response.data['CodRetorno'] == 1) {
      return [];
    }

    List<BoletoModel> boletos = [];

    var boletosVencidos = (response.data['Vencidos'] as List).map((item) {
      return BoletoModel.fromJson(item);
    }).toList();

    for (var boleto in boletosVencidos) {
      boletos.add(boleto);
    }

    var boletosAbertos = (response.data['EmAberto'] as List).map((item) {
      return BoletoModel.fromJson(item);
    }).toList();

    for (var boleto in boletosAbertos) {
      boletos.add(boleto);
    }

    print(boletos);

    // return [
    //   BoletoModel.fromJson({
    //     "CodBoleto": "720",
    //     "Competencia": "03/2021",
    //     "DataVencimento": "31/03/2021",
    //     "DataVencimentoOriginal": null,
    //     "DescSituacao": "Em Aberto",
    //     "DiasVencido": "24",
    //     "IsAlteracaoValor": false,
    //     "IsDebitoAutomatico": false,
    //     "IsNotificacao": false,
    //     "LinhaDigitavel":
    //         "23793 06000 90000 000043 72002 403508 5 85370000061833",
    //     "NumFatura": "495",
    //     "PagoEm": "18/03/2021",
    //     "Status": "0",
    //     "ValAtualizado": "618,33",
    //     "Valor": "618,33"
    //   },
    //   )
    // ];

    //await 5.seconds.delay();

    return boletos;
  }

  Future<List<BoletoModel>> boletosVencidos() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
      'authorization': 'Bearer ${userLogged.token}'
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Cobranca/${userLogged.planos[0].codBeneficiario}/boletos?ind_a_vencer=S&ind_vencidos=S&ind_pagos=S",
        options: Options(headers: headers));

    if (response.data['CodRetorno'] == 1) {
      return [];
    }

    var boletos = (response.data['Vencidos'] as List).map((item) {
      return BoletoModel.fromJson(item);
    }).toList();

    return boletos;
  }

  Future<List<BoletoModel>> boletosPagos() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
      'authorization': 'Bearer ${userLogged.token}'
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Cobranca/${userLogged.planos[0].codBeneficiario}/boletos?ind_a_vencer=S&ind_vencidos=S&ind_pagos=S",
        options: Options(headers: headers));

    if (response.data['CodRetorno'] == 1) {
      return [];
    }

    var boletos = (response.data['Pagos'] as List).map((item) {
      return BoletoModel.fromJson(item);
    }).toList();

    return boletos;
  }

  Future<bool> enviaBoletoEmail(String codBoleto, String email) async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
      'authorization': 'Bearer ${userLogged.token}'
    };

    final body = {
      'Email': email,
      'cod_ts': userLogged.planos[0].codBeneficiario
    };

    var response = await Dio().post(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Cobranca/$codBoleto/email",
        options: Options(headers: headers),
        data: body);

    print(response.data);
  }
}
