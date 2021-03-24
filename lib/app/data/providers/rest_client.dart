import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';

class RestClient extends GetConnect {
  String baseUrl =
      'https://vipriosaude-api-mob-beneficiario.topsaude.com.br/api/v1';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;

    httpClient.addResponseModifier((request, response) {
      //request.headers['x-api-key'] = '595a430e1e364be4952d4ceba47f6db1';
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
        '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
        '╟ url: ${request.url}\n'
        '╟ Headers: ${request.headers}\n'
        // 'Body: ${request?.bodyBytes?.map((event) => event.asMap().toString()) ?? ''}\n'
        '╟ Status Code: ${response.statusCode}\n'
        // '╟ Data: ${response?.bodyString?.toString() ?? ''}'
        '\n╚══════════════════════════ Response ══════════════════════════\n',
        wrapWidth: 1024,
      );

      return response;
    });

    // httpClient.addResponseModifier((request, response) {
    //   print(response);
    //   print(request);
    //   final res = response.bodyString;
    //   if (res.contains('<Error>')) {
    //     print('token expirou');

    //     Get.offAllNamed(Routes.LOGIN);

    //     Get.defaultDialog(
    //       title: 'Aviso',
    //       titleStyle: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //       middleText: 'Acesso expirado. Você deve entrar novamente',
    //       middleTextStyle: TextStyle(
    //         color: Colors.white,
    //       ),
    //       backgroundColor: Color(0XFFF37E77),
    //       radius: 20,
    //       textConfirm: 'OK',
    //       onConfirm: Get.back,
    //       confirmTextColor: Colors.red,
    //       buttonColor: Colors.white,
    //     );
    //   }
    //   return response;
    // });
  }

  // RestClient() {
  //   httpClient.baseUrl = baseUrl;

  //   httpClient.addResponseModifier((request, response) {
  //     print(response);
  //     print(request);
  //     final res = response.bodyString;
  //     if (res.contains('<Error>')) {
  //       print('token expirou');

  //       Get.offAllNamed(Routes.LOGIN);

  //       Get.defaultDialog(
  //         title: 'Aviso',
  //         titleStyle: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //         middleText: 'Acesso expirado. Você deve entrar novamente',
  //         middleTextStyle: TextStyle(
  //           color: Colors.white,
  //         ),
  //         backgroundColor: Color(0XFFF37E77),
  //         radius: 20,
  //         textConfirm: 'OK',
  //         onConfirm: Get.back,
  //         confirmTextColor: Colors.red,
  //         buttonColor: Colors.white,
  //       );
  //     }
  //   });
  // }
}

class RestClientException implements Exception {
  final int code;
  final String message;

  RestClientException(this.message, {this.code});

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
