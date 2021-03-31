import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/menu_card.dart';

import '../controllers/financial_controller.dart';

class FinancialView extends GetView<FinancialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipBehavior: Clip.antiAlias,
                clipper: CustomAppbar(),
                child: Container(
                  height: 130,
                  color: MainTheme.backgroundColor,
                ),
              ),
              Container(
                height: 100,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 35, left: 20),
                        child: Image.asset(
                          'assets/sorriso.png',
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 40),
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
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Financeiro',
            style: TextStyle(
                color: MainTheme.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          MenuCard(
            icon: FontAwesomeIcons.file,
            title: '2ª via Boleto (abertos)',
            description: 'Gere a segunda via do seu boleto',
          ),
          SizedBox(
            height: 10,
          ),
          MenuCard(
            icon: FontAwesomeIcons.file,
            title: 'Histórico de Boleto (pagos)',
            description: 'Gere a segunda via do seu boleto',
          ),
          SizedBox(
            height: 10,
          ),
          MenuCard(
            icon: FontAwesomeIcons.file,
            title: 'Imposto de Renda',
            description: 'Informe do Imposto de Renda',
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
              width: Get.width * .8,
              height: 50,
              onPressed: () {
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
