import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/forgot_password_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';

class ForgotPasswordController extends GetxController
    with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  final loading = false.obs;
  final message = Rx<MessageModel>();

  ForgotPasswordController(this._repository);

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

  Future<void> forgotPassword(String cpf, String email) async {
    try {
      loading(true);
      message(null);

      ForgotPasswordModel result = await _repository.forgotPassword(cpf, email);

      loading(false);
      print(result);

      if (result.codRetorno == 1) {
        message(MessageModel('Aviso', result.msgRetorno));
        return;
      }

      Get.offAllNamed(Routes.FORGOT_PASSWORD_RESULT,
          parameters: {'email': email});
    } on RestClientException catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Alerta', e.message));
    } catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Alerta', 'Erro ao reenviar senha.'));
    }
  }
}
