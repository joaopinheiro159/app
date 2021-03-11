import 'package:get/get.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final UserRepository _repository;
  final _obscureText = true.obs;

  LoginController(this._repository);

  get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(String cpf, String senha) async {
    try {
      final user = await _repository.login(cpf, senha);
      final sp = await SharedPreferences.getInstance();

      await sp.setString('user', user.toJson());
      print(user);

      Get.offAllNamed(Routes.SPLASH);
    } catch (e) {
      print(e);
    }
  }
}
