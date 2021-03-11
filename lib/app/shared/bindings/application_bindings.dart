import 'package:get/get.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
