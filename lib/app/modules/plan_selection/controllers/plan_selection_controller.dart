import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanSelectionController extends GetxController with StateMixin {
  final UserController _userController =
      Get.put<UserController>(UserController());

  UserModel get user => _userController.user;
  BeneficiarioModel get beneficiario => _userController.beneficiario;

  @override
  void onInit() {
    super.onInit();

    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    change([], status: RxStatus.loading());

    try {
      change(await SharedPreferences.getInstance(), status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> logout() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();

    Get.offAllNamed(Routes.LOGIN);
  }
}
