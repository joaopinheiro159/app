import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/dependentes_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final UserController _userController =
      Get.put<UserController>(UserController());
  final UserRepository _repository;

  final loading = false.obs;
  final message = Rx<MessageModel>();

  MenuController(this._repository);

  UserModel get user => _userController.user;
  BeneficiarioModel get beneficiario => _userController.beneficiario;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
