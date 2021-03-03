import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/custom_shape.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipBehavior: Clip.antiAlias,
                  clipper: CustomAppbar(),
                  child: Container(
                    height: 220,
                    color: MainTheme.backgroundColor,
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 35, left: 20),
                        child: Image.asset(
                          'assets/sorriso.png',
                          height: 40,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 35),
                          child: Image.asset(
                            'assets/klini_area_cliente.png',
                            height: 40,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 35, right: 20),
                          child: Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
