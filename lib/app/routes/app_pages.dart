import 'package:get/get.dart';

import 'package:klinimed_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:klinimed_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:klinimed_app/app/modules/home/bindings/home_binding.dart';
import 'package:klinimed_app/app/modules/home/views/home_view.dart';
import 'package:klinimed_app/app/modules/login/bindings/login_binding.dart';
import 'package:klinimed_app/app/modules/login/views/login_view.dart';
import 'package:klinimed_app/app/modules/menu/bindings/menu_binding.dart';
import 'package:klinimed_app/app/modules/menu/views/menu_view.dart';
import 'package:klinimed_app/app/modules/register/bindings/register_binding.dart';
import 'package:klinimed_app/app/modules/register/views/register_view.dart';
import 'package:klinimed_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:klinimed_app/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
  ];
}
