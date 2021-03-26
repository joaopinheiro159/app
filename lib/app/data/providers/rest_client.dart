import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestClient extends GetConnect {
  String baseUrl =
      'https://vipriosaude-api-mob-beneficiario.topsaude.com.br/api/v1';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;

    httpClient.addResponseModifier((request, response) {
      if (response.hasError) {
        print(response.statusCode);
        print('erro de token');
      }

      //request.headers['x-api-key'] = '595a430e1e364be4952d4ceba47f6db1';
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
        '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
        '╟ url: ${request.url}\n'
        '╟ Headers: ${request.headers}\n'
        '╟ Status Code: ${response.statusCode}\n'
        '\n╚══════════════════════════ Response ══════════════════════════\n',
        wrapWidth: 1024,
      );

      return response;
    });
  }
}

class RestClientException implements Exception {
  final int code;
  final String message;

  RestClientException(this.message, {this.code});

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
