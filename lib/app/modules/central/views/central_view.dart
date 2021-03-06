import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/central_list_text.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/central_controller.dart';

class CentralView extends GetView<CentralController> {
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
                        Get.offAllNamed(Routes.PLAN_SELECTION);
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
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.MENU);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 35, right: 20),
                        child: Icon(
                          Icons.menu,
                          size: 40,
                          color: Colors.white,
                        ),
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
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Central 24h',
                    style: TextStyle(
                        color: MainTheme.backgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CentralListText(
                    texto: 'Todas as funcionalidades em uma ??nica tela.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CentralListText(
                    texto: 'Ligue para a Central com apenas um clique.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CentralListText(
                    texto:
                        'Fique sabendo quando seus procedimentos forem aprovados com uma notifica????o enviada pelo App.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CentralListText(
                    texto:
                        'Encontre e trace rota at?? os prestadores de sa??de da sua rede mais pr??ximos de voc??.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CentralListText(
                    texto:
                        'Salve seus prestadores favoritos, receitas, medicamentos e at?? exames.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CentralListText(
                    texto:
                        'Acesse a conte??dos de sa??de atualizados e confi??veis.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Telefone',
                    style: TextStyle(
                      color: Color(0XFF7B9EB1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '(21) 3952-9190',
                    style: TextStyle(
                      color: Color(0XFF7B9EB1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Op????o 1',
                    style: TextStyle(
                      color: Color(0XFF7B9EB1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final _url =
                                'https://play.google.com/store/apps/details?id=br.com.carelink.centralsaude&hl=pt';
                            await canLaunch(_url)
                                ? await launch(_url)
                                : throw 'Could not launch $_url';
                          },
                          child: Image.asset(
                            'assets/googleplay_badge.png',
                            width: 150,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final _url =
                                'https://apps.apple.com/br/app/central-sa%C3%BAde-24/id1229817641';
                            await canLaunch(_url)
                                ? await launch(_url)
                                : throw 'Could not launch $_url';
                          },
                          child: Image.asset(
                            'assets/appstore_badge.png',
                            width: 142,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  KliniButton(
                    label: 'VOLTAR',
                    buttonColor: Color(0XFF7B9EB1),
                    labelColor: Colors.white,
                    width: Get.width * .50,
                    height: 50,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
