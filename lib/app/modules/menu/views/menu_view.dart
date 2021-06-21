import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/menu/controllers/menu_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/boleto_card.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/horizontal_wallet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Column _buildBody() {
    return Column(
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
                    height: 230.0,
                    viewportFraction: 0.7,
                    pageSnapping: true,
                    disableCenter: false,
                    enableInfiniteScroll: false,
                  ),
                  items: controller.beneficiarios.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          child: HorizontalWallet(
                            nomeBeneficiario: i.beneficiario.nomeCartao,
                            numeroCarteira: i.beneficiario.numeroAssociado,
                            plano: i.beneficiario.nomePlano,
                            segmentacao: i.beneficiario.segmentacao,
                            vigencia: i.beneficiario.inicioVigencia,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.WALLET,
                                arguments: i.beneficiario);
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Último Boleto',
                  style: TextStyle(
                      color: MainTheme.backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                BoletoCard(
                  anoMes: controller.ultimoBoleto.value.dataVencimento
                      .substring(3, 10),
                  status: controller.ultimoBoleto.value.descSituacao
                      .replaceAll('as', 'o'),
                  boleto: controller.ultimoBoleto.value,
                  valor: 'R\$${controller.ultimoBoleto.value.valor}',
                ),
                SizedBox(height: 10),
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
                GestureDetector(
                  onTap: () async {
                    final _url = 'https://agendar.amplimed.com.br/klini';
                    await canLaunch(_url)
                        ? await launch(_url)
                        : throw 'Could not launch $_url';
                  },
                  child: MenuCard(
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
                    label: 'VOLTAR',
                    buttonColor: Color(0XFF7B9EB1),
                    height: 60,
                    labelColor: Colors.white,
                    onPressed: () {
                      Get.offNamed(Routes.PLAN_SELECTION);
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
    );
  }
}
