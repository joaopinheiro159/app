import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/bairro_model.dart';
import 'package:klinimed_app/app/data/models/cidade_model.dart';
import 'package:klinimed_app/app/data/models/especialidade_model.dart';
import 'package:klinimed_app/app/modules/referenced_search/controllers/referenced_search_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';

class ReferencedSearchView extends GetView<ReferencedSearchController> {
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
            'Rede Referenciada',
            style: TextStyle(
                color: MainTheme.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width * 0.8,
            height: 50,
            child: DropdownSearch<CidadeModel>(
              maxHeight: 300,
              onFind: (String filter) => controller.getCidades(),
              onChanged: (cidade) {
                print(cidade.codCidade);
                controller.codCidade.value = cidade.codCidade;
                controller.nomeCidade.value = cidade.nome;
              },
              selectedItem: CidadeModel(nome: 'Informe a cidade'),
              dropdownBuilder:
                  (BuildContext context, item, String itemAsString) {
                return Text(
                  itemAsString,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0XFF7B9EB1),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              showSearchBox: true,
              dropdownSearchDecoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                enabledBorder: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.8,
            height: 50,
            child: DropdownSearch<BairroModel>(
              maxHeight: 300,
              onFind: (String filter) => controller.getBairros(),
              onChanged: (bairro) {
                controller.codBairro.value = bairro.codBairro;
                controller.nomeBairro.value = bairro.nome;
              },
              selectedItem: BairroModel(nome: 'Informe o bairro'),
              dropdownBuilder:
                  (BuildContext context, item, String itemAsString) {
                return Text(
                  itemAsString,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0XFF7B9EB1),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              showSearchBox: true,
              dropdownSearchDecoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                enabledBorder: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.8,
            height: 50,
            child: DropdownSearch<EspecialidadeModel>(
              maxHeight: 300,
              onFind: (String filter) => controller.getEspecialidade(),
              onChanged: (especialidade) {
                controller.codEspecialidade.value =
                    especialidade.codEspecialidade;

                controller.nomeEspecialidade.value = especialidade.descricao;
              },
              selectedItem:
                  EspecialidadeModel(descricao: 'Informe a especialidade'),
              dropdownBuilder:
                  (BuildContext context, item, String itemAsString) {
                return Text(
                  itemAsString,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0XFF7B9EB1),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              showSearchBox: true,
              dropdownSearchDecoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                enabledBorder: new OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MainTheme.backgroundColor,
                    width: 2,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          KliniButton(
            width: Get.width * 0.8,
            height: 50,
            buttonColor: MainTheme.backgroundColor,
            labelColor: Colors.white,
            label: 'Pesquisar',
            onPressed: () {
              Get.toNamed(Routes.REFERENCED_SEARCH_RESULT, parameters: {
                'codCidade': controller.codCidade.value,
                'nomeCidade': controller.nomeCidade.value,
                'codBairro': controller.codBairro.value,
                'nomeBairro': controller.nomeBairro.value,
                'codEspecialidade': controller.codEspecialidade.value,
                'nomeEspecialidade': controller.nomeEspecialidade.value,
              });
            },
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
                Get.offAllNamed(Routes.MENU);
              },
            ),
          )
        ],
      ),
    );
  }
}
