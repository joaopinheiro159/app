import 'package:get/get.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';

import '../controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(MenuController(Get.find()));

    Get.put(UserController());
  }
}
