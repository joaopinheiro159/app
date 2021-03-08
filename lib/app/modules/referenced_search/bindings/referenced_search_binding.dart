import 'package:get/get.dart';

import '../controllers/referenced_search_controller.dart';

class ReferencedSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferencedSearchController>(
      () => ReferencedSearchController(),
    );
  }
}
