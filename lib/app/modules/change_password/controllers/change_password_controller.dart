import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController
    with LoaderMixin, MessagesMixin {
  final _obscureTextCurrentPassword = true.obs;
  final _obscureTextNewPassword = true.obs;
  final loading = false.obs;
  final message = Rx<MessageModel>();
  final UserRepository _repository;

  ChangePasswordController(this._repository);

  get obscureTextCurrentPassword => _obscureTextCurrentPassword.value;
  get obscureTextNewPassword => _obscureTextNewPassword.value;

  void showHideCurrentPassword() => _obscureTextCurrentPassword.toggle();
  void showHideNewPassword() => _obscureTextNewPassword.toggle();

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> changePassword(
      String cpf, String currentPassword, String newPassword) async {
    try {
      final sp = await SharedPreferences.getInstance();

      final user = UserModel.fromJson(sp.getString('user'));

      loading(true);
      final changePassword = await _repository.changePassword(
          cpf, currentPassword, newPassword, user.token);

      loading(false);
      if (changePassword) {
        Get.offAllNamed(Routes.LOGIN);

        await sp.clear();

        Get.defaultDialog(
          title: 'Aviso',
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          middleText: 'Senha alterada com sucesso. Você deve entrar novamente',
          middleTextStyle: TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Color(0XFFF37E77),
          radius: 20,
          textConfirm: 'OK',
          onConfirm: Get.back,
          confirmTextColor: Colors.red,
          buttonColor: Colors.white,
        );
      } else {
        Get.defaultDialog(
          title: 'Aviso',
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          middleText: 'Usuário ou senha inválidos.',
          middleTextStyle: TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Color(0XFFF37E77),
          radius: 20,
          textConfirm: 'OK',
          onConfirm: Get.back,
          confirmTextColor: Colors.red,
          buttonColor: Colors.white,
        );
      }
    } on RestClientException catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Alerta', e.message));
    } catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Alerta', 'Usuário ou senha inválidos'));
    }
  }
}
