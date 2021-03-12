import 'package:get/get.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  final _obscureText = true.obs;
  final loading = false.obs;
  final message = Rx<MessageModel>();

  LoginController(this._repository);

  get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login(String cpf, String senha) async {
    try {
      loading(true);
      message(null);

      final user = await _repository.login(cpf, senha);

      final sp = await SharedPreferences.getInstance();

      await sp.setString('user', user.toJson());

      loading(false);
      print(user);

      Get.offAllNamed(Routes.SPLASH);
    } on RestClientException catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Erro', e.message));
    } catch (e) {
      print(e);
      loading(false);
      message(MessageModel('Erro', 'Usuário ou senha inválidos'));
    }
  }
}
