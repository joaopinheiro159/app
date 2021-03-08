import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/horizontal_wallet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/menu_card.dart';

class MenuView extends GetView<MenuController> {
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
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Carteirinha Digital',
                    style: TextStyle(
                        color: MainTheme.backgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 0.7,
                      pageSnapping: true,
                      disableCenter: false,
                      enableInfiniteScroll: false,
                    ),
                    items: [1, 2].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            child: HorizontalWallet(),
                            onTap: () {
                              Get.toNamed(Routes.WALLET);
                            },
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REFERENCED_SEARCH);
                    },
                    child: MenuCard(
                      icon: FontAwesomeIcons.mapMarkerAlt,
                      title: 'Rede Referenciada',
                      description:
                          'Encontre a rede de médicos e hospitais disponíveis para o seu plano.',
                    ),
                  ),
                  SizedBox(height: 10),
                  MenuCard(
                    icon: FontAwesomeIcons.commentMedical,
                    title: 'Médico de Referência',
                    description:
                        'Faça um primeiro atendimento com seu médico de referência.',
                  ),
                  SizedBox(height: 10),
                  MenuCard(
                    icon: FontAwesomeIcons.dollarSign,
                    title: 'Financeiro',
                    description:
                        'Consulte ser histórico de pagamento, segunda via, boleto digital, imposto de renda…',
                  ),
                  SizedBox(height: 10),
                  MenuCard(
                    icon: FontAwesomeIcons.clock,
                    title: 'Central 24h',
                    description:
                        'Programas de saúde 24 horas, consultas, exames, procedimentos…',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width * 0.80,
                    child: KliniButton(
                      label: 'SAIR',
                      buttonColor: Color(0XFFF27E77),
                      height: 60,
                      labelColor: Colors.white,
                      onPressed: () {
                        Get.offNamed(Routes.LOGIN);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
