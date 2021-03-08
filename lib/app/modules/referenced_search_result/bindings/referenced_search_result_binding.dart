import 'package:get/get.dart';

import '../controllers/referenced_search_result_controller.dart';

class ReferencedSearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferencedSearchResultController>(
      () => ReferencedSearchResultController(),
    );
  }
}
