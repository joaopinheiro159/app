import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/user_logged.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _logged = UserLogged.empty.obs;

  @override
  void onInit() {
    super.onInit();

    ever<UserLogged>(_logged, _checkIsLogged);

    initTheme();

    checkLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initTheme() {
    MainTheme.init(Get.context);
  }

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();

    if (sp.containsKey('user')) {
      print('usuario logado ${sp.get('user')}');
      _logged(UserLogged.authenticated);
    } else {
      _logged(UserLogged.unauthenticated);
      await 1.seconds.delay();
      Get.offNamed(Routes.LOGIN);
    }
  }

  void _checkIsLogged(UserLogged userLogged) {
    switch (userLogged) {
      case UserLogged.authenticated:
        Get.offAllNamed(Routes.PLAN_SELECTION);
        print('indo para home');
        break;
      case UserLogged.unauthenticated:
        Get.offAllNamed(Routes.LOGIN);
        print('indo para login');
        break;
      case UserLogged.empty:
      default:
    }
  }
}
