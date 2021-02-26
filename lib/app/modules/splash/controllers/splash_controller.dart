import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

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
    // TODO: check if user is logged and redirects to proper page

    await 1.seconds.delay();
    Get.offNamed(Routes.LOGIN);
  }
}
