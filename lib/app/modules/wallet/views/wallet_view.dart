import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/horizontal_wallet_export.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/vertical_wallet.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class WalletView extends GetView<WalletController> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
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
                height: 30,
              ),
              Text(
                'Carteirinha Digital',
                style: TextStyle(
                    color: MainTheme.backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: VerticalWallet(
                  nomeBeneficiario: controller.beneficiario.nomeCartao,
                  numeroCarteira: controller.beneficiario.numeroAssociado,
                  plano: controller.beneficiario.nomePlano,
                  segmentacao: controller.beneficiario.segmentacao,
                  vigencia: controller.beneficiario.inicioVigencia,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              KliniButton(
                label: 'COMPARTILHAR',
                buttonColor: MainTheme.backgroundColor,
                labelColor: Colors.white,
                width: Get.width * .50,
                height: 50,
                onPressed: () {
                  _showDialog(context);
                },
              ),
              SizedBox(
                height: 10,
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
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _takeScreenshot() async {
    final imageFile = await _screenshotController.capture(pixelRatio: 1.5);

    Share.shareFiles([imageFile.path]);

    Get.back();
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                Center(
                  child: Screenshot(
                    controller: _screenshotController,
                    child: HorizontalWalletExport(
                      nomeBeneficiario: controller.beneficiario.nomeCartao,
                      numeroCarteira: controller.beneficiario.numeroAssociado,
                      plano: controller.beneficiario.nomePlano,
                      segmentacao: controller.beneficiario.segmentacao,
                      vigencia: controller.beneficiario.inicioVigencia,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                KliniButton(
                  label: 'COMPARTILHAR',
                  buttonColor: MainTheme.backgroundColor,
                  labelColor: Colors.white,
                  width: Get.width * .50,
                  height: 50,
                  onPressed: () {
                    _takeScreenshot();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
