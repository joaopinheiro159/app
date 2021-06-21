import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'klini_button.dart';
import 'menu_card.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainTheme.backgroundColor,
      child: Column(
        children: [
          Container(
            color: MainTheme.backgroundColor,
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
                Container(
                  padding: EdgeInsets.only(top: 35, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.REFERENCED_SEARCH);
            },
            child: MenuCard(
              side: BorderSide(color: Colors.white),
              icon: FontAwesomeIcons.mapMarkerAlt,
              title: 'Rede Referenciada',
              description:
                  'Encontre a rede de médicos e hospitais disponíveis para o seu plano.',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              final _url = 'https://agendar.amplimed.com.br/klini';
              await canLaunch(_url)
                  ? await launch(_url)
                  : throw 'Could not launch $_url';
            },
            child: MenuCard(
              side: BorderSide(color: Colors.white),
              icon: FontAwesomeIcons.commentMedical,
              title: 'Médico de Referência',
              description:
                  'Faça um primeiro atendimento com seu médico de referência.',
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.FINANCIAL);
            },
            child: MenuCard(
              side: BorderSide(color: Colors.white),
              icon: FontAwesomeIcons.dollarSign,
              title: 'Financeiro',
              description:
                  'Consulte ser histórico de pagamento, segunda via, boleto digital, imposto de renda…',
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CENTRAL);
            },
            child: MenuCard(
              side: BorderSide(color: Colors.white),
              icon: FontAwesomeIcons.clock,
              title: 'Central 24h',
              description:
                  'Programas de saúde 24 horas, consultas, exames, procedimentos…',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.80,
            child: KliniButton(
              label: 'Fechar',
              buttonColor: Colors.white,
              height: 60,
              labelColor: MainTheme.backgroundColor,
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
