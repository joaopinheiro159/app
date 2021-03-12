import 'package:get/get.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}
