import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';

import '../controllers/plan_selection_controller.dart';

class PlanSelectionView extends GetView<PlanSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Image.asset(
              'assets/klini_area_cliente.png',
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://reqres.in/img/faces/9-image.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'MARCIO ANTONIO ROCHA DA CRUZ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                'CPF: 12405298724',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.75,
              child: FlatButton(
                color: Colors.white,
                height: 50,
                onPressed: () {
                  Get.toNamed(Routes.MENU);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.heartbeat,
                      color: MainTheme.backgroundColor,
                    ),
                    Text(
                      'KLINI FÁCIL - 999999999',
                      style: TextStyle(
                        color: MainTheme.backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_rounded,
                      color: MainTheme.backgroundColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.75,
              height: 50,
              child: FlatButton(
                color: MainTheme.backgroundColor,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.tooth,
                      color: Colors.white,
                    ),
                    Text(
                      'KLINI DENTAL FÁCIL - 888888888',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: Get.width * 0.75,
              child: KliniButton(
                buttonColor: Colors.white,
                labelColor: MainTheme.backgroundColor,
                height: 50,
                label: 'Alterar Senha',
                labelSize: 15,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: KliniButton(
                label: 'VOLTAR',
                buttonColor: Color(0XFF7B9EB1),
                labelColor: Colors.white,
                width: Get.width * .75,
                height: 50,
                onPressed: () {
                  Get.offNamed(Routes.LOGIN);
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
