import 'package:get/get.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(ForgotPasswordController(Get.find()));
  }
}
