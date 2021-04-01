import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/boleto_model.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';

import '../controllers/financial_controller.dart';

class FinancialPayedView extends GetView<FinancialController> {
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
            'Boletos Pagos',
            style: TextStyle(
                color: MainTheme.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: MainTheme.backgroundColor,
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          color: MainTheme.backgroundColor,
                          child: Text(
                            '#',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          child: Text(
                            'Referência',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          child: Text(
                            'Situação',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          child: Text(
                            'Valor',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            child: FutureBuilder(
              future: controller.boletosPagos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                      child: Text('Nenhum boleto localizado'),
                    );
                  }
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                  );
                }

                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final BoletoModel boleto = snapshot.data[index];
                      // return ListTile(
                      //   leading: Text(
                      //     (index + 1).toString(),
                      //     style: TextStyle(fontSize: 25),
                      //   ),
                      //   title: Text('R\$ ${boleto.valAtualizado}'),
                      //   subtitle: Text(
                      //       'Referência: ${boleto.competencia}\nSituação: ${boleto.descSituacao}'),
                      //   isThreeLine: true,
                      // );
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FINANCIAL_RESULT,
                              arguments: boleto);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: Card(
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          (index + 1).toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Container(
                                              child: Text(boleto.competencia),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Container(
                                              child: Text(boleto.descSituacao
                                                  .replaceAll('s', '')),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Container(
                                              child: Text(
                                                  'R\$${boleto.valAtualizado}'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 5.0),
                                              child: Icon(
                                                  FontAwesomeIcons.arrowRight),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
