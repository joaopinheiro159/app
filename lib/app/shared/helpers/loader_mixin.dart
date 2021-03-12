import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        Get.dialog(
          Center(
            child: CircularProgressIndicator(
              valueColor:
                  new AlwaysStoppedAnimation<Color>(MainTheme.backgroundColor),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
