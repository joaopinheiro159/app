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
      final beneficiario = await _repository.obterBeneficiario(
          user.planos[0].codBeneficiario, user.token);

      // print(beneficiario.toMap());

      // final dependentesSaude = await _repository.getDependents(
      //     user.planos[0].codBeneficiario, user.token);

      // final dependentesDental = await _repository.getDependents(
      //     user.planos[1].codBeneficiario, user.token);

      // print(dependentesSaude);
      // print(dependentesDental);

      final sp = await SharedPreferences.getInstance();

      print('credenciais antigas ${sp.getString('user')}');

      await sp.setString('user', user.toJson());
      await sp.setString('beneficiario', beneficiario.toJson());

      // armazena informações de login para renovar token
      // não é a melhor forma mas a API não possui refresh token

      await sp.setString('cpf', cpf);
      await sp.setString('senha', senha);

      // await sp.setString('dependentesSaude', dependentesSaude.toJson());
      // await sp.setString('dependentesDental', dependentesDental.toJson());

      loading(false);
      print(user);

      Get.offAllNamed(Routes.SPLASH);
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

  Future<void> renewToken(String cpf, String senha) async {
    try {
      message(null);

      final user = await _repository.login(cpf, senha);
      final beneficiario = await _repository.obterBeneficiario(
          user.planos[0].codBeneficiario, user.token);

      final sp = await SharedPreferences.getInstance();

      print('credenciais antigas ${sp.getString('user')}');

      await sp.setString('user', user.toJson());
      await sp.setString('beneficiario', beneficiario.toJson());

      // armazena informações de login para renovar token
      // não é a melhor forma mas a API não possui refresh token

      await sp.setString('cpf', cpf);
      await sp.setString('senha', senha);

      Get.offAllNamed(Routes.PLAN_SELECTION);
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
