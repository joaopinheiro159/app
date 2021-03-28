import 'package:get/get.dart';

import 'package:klinimed_app/app/modules/central/bindings/central_binding.dart';
import 'package:klinimed_app/app/modules/central/views/central_view.dart';
import 'package:klinimed_app/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:klinimed_app/app/modules/change_password/views/change_password_view.dart';
import 'package:klinimed_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:klinimed_app/app/modules/forgot_password/views/forgot_password_result_view.dart';
import 'package:klinimed_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:klinimed_app/app/modules/home/bindings/home_binding.dart';
import 'package:klinimed_app/app/modules/home/views/home_view.dart';
import 'package:klinimed_app/app/modules/login/bindings/login_binding.dart';
import 'package:klinimed_app/app/modules/login/views/login_view.dart';
import 'package:klinimed_app/app/modules/menu/bindings/menu_binding.dart';
import 'package:klinimed_app/app/modules/menu/views/menu_view.dart';
import 'package:klinimed_app/app/modules/plan_selection/bindings/plan_selection_binding.dart';
import 'package:klinimed_app/app/modules/plan_selection/views/plan_selection_view.dart';
import 'package:klinimed_app/app/modules/referenced_search/bindings/referenced_search_binding.dart';
import 'package:klinimed_app/app/modules/referenced_search/views/referenced_search_view.dart';
import 'package:klinimed_app/app/modules/referenced_search_result/bindings/referenced_search_result_binding.dart';
import 'package:klinimed_app/app/modules/referenced_search_result/views/referenced_search_result_view.dart';
import 'package:klinimed_app/app/modules/register/bindings/register_binding.dart';
import 'package:klinimed_app/app/modules/register/views/register_success_view.dart';
import 'package:klinimed_app/app/modules/register/views/register_view.dart';
import 'package:klinimed_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:klinimed_app/app/modules/splash/views/splash_view.dart';
import 'package:klinimed_app/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:klinimed_app/app/modules/wallet/views/wallet_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

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
      name: _Paths.REGISTER_SUCCESS,
      page: () => RegisterSuccessView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_RESULT,
      page: () => ForgotPasswordResultView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.PLAN_SELECTION,
      page: () => PlanSelectionView(),
      binding: PlanSelectionBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.REFERENCED_SEARCH,
      page: () => ReferencedSearchView(),
      binding: ReferencedSearchBinding(),
    ),
    GetPage(
      name: _Paths.REFERENCED_SEARCH_RESULT,
      page: () => ReferencedSearchResultView(),
      binding: ReferencedSearchResultBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CENTRAL,
      page: () => CentralView(),
      binding: CentralBinding(),
    ),
  ];
}
