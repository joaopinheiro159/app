import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/plan_selection_button.dart';

import '../controllers/plan_selection_controller.dart';

class PlanSelectionView extends GetView<PlanSelectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: controller.obx(
          (state) {
            return _buildBody();
          },
          onLoading: Center(
            child: CupertinoActivityIndicator(
              radius: 10,
            ),
          ),
          onError: (String error) {
            return Center(
              child: Text('Erro'),
            );
          }),
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
            Container(
              child: Image.asset(
                'assets/klini_area_cliente.png',
                height: 90,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                    "https://reqres.in/img/faces/9-image.jpg",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                controller.beneficiario.beneficiario?.nomeCartao,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                'CPF: ${controller.beneficiario.beneficiario?.cpf}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var plano in controller.user.planos)
              PlanSelectionButton(
                nomePlano: plano.nomePlano,
                codBeneficiario: plano.codBeneficiario,
              ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: Get.width * 0.80,
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
                  controller.logout();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
