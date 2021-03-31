import 'package:get/get.dart';
import 'package:klinimed_app/app/data/repositories/prestador_repository.dart';

import '../controllers/referenced_search_result_controller.dart';

class ReferencedSearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrestadorRepository(Get.find()));
    Get.put(ReferencedSearchResultController(Get.find()));
  }
}
