import 'package:get/get.dart';

import '../controllers/central_controller.dart';

class CentralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CentralController>(
      () => CentralController(),
    );
  }
}
