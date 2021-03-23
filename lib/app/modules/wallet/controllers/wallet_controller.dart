import 'package:get/get.dart';

class WalletController extends GetxController {
  dynamic _beneficiario;

  dynamic get beneficiario => _beneficiario;

  @override
  void onInit() {
    super.onInit();
    _beneficiario = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
