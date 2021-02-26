import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: MainTheme.backgroundColor,
          body: Center(
            child: CupertinoActivityIndicator(
              radius: 10,
            ),
          ),
        );
      },
    );
  }
}
