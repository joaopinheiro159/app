import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  final birthDateTextEditingController = TextEditingController();
  final loading = false.obs;
  final message = Rx<MessageModel>();

  RegisterController(this._repository);

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

  Future<void> register(String cpf, String senha, String dataNascimento) async {
    try {
      loading(true);
      message(null);

      final result = await _repository.register(cpf, senha, dataNascimento);

      loading(false);
      print(result);

      Get.offAllNamed(Routes.LOGIN);

      message(MessageModel(
          'Alerta', 'Usuário cadastrado com sucesso. Favor efetuar o login.'));
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
