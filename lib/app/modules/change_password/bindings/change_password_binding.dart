import 'package:get/get.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(RestClient());
    Get.put(ChangePasswordController(Get.find()));
  }
}
