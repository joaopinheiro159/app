import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/referenced_search_result/controllers/referenced_search_result_controller.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';

class ReferencedSearchResultView
    extends GetView<ReferencedSearchResultController> {
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
                    Container(
                      padding: EdgeInsets.only(top: 35, left: 20),
                      child: Image.asset(
                        'assets/sorriso.png',
                        height: 40,
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
            'Resultados encontrados para a consulta:',
            style: TextStyle(
                color: MainTheme.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width * 0.90,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'RIO DE JANEIRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: MainTheme.backgroundColor,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'SÃO JOÃO DE MERITI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: MainTheme.backgroundColor,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'CARDIOLOGISTA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: MainTheme.backgroundColor,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'DOUTOR JOÃO DA SAÚDE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: MainTheme.backgroundColor,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.90,
            child: Card(
              elevation: 1,
              color: Color(0XFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CEMOL',
                      style: TextStyle(
                          color: MainTheme.backgroundColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'R R LUIZ BELTRAO, 424 - VILA VALQUEIRE - 21321-230 - RIO DE JANEIRO/RJ',
                      style: TextStyle(
                        color: Color(0XFF7B9EB1),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.businessTime,
                          color: Color(0XFF7B9EB1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'CONSULTÓRIO MÉDICO',
                          style: TextStyle(
                            color: Color(0XFF7B9EB1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.phone,
                          color: Color(0XFF7B9EB1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '21 - 3952-9190',
                          style: TextStyle(
                            color: Color(0XFF7B9EB1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Get.width * 0.90,
            child: Card(
              elevation: 1,
              color: Color(0XFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CEMOL',
                      style: TextStyle(
                          color: MainTheme.backgroundColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'R R LUIZ BELTRAO, 424 - VILA VALQUEIRE - 21321-230 - RIO DE JANEIRO/RJ',
                      style: TextStyle(
                        color: Color(0XFF7B9EB1),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.businessTime,
                          color: Color(0XFF7B9EB1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'CONSULTÓRIO MÉDICO',
                          style: TextStyle(
                            color: Color(0XFF7B9EB1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.phone,
                          color: Color(0XFF7B9EB1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '21 - 3952-9190',
                          style: TextStyle(
                            color: Color(0XFF7B9EB1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
