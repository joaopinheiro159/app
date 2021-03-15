import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';

import '../controllers/plan_selection_controller.dart';

class PlanSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.lazyPut<PlanSelectionController>(
      () => PlanSelectionController(),
    );
  }
}
