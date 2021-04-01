import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/especialidade_prestador_model.dart';
import 'package:klinimed_app/app/data/models/prestador_model.dart';
import 'package:klinimed_app/app/modules/referenced_search/controllers/referenced_search_controller.dart';
import 'package:klinimed_app/app/modules/referenced_search_result/controllers/referenced_search_result_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/custom_appbar.dart';
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
                      controller.nomeCidade == ""
                          ? 'Busca por todos'
                          : controller.nomeCidade,
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
                      controller.nomeBairro,
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
                      controller.nomeEspecialidade,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 400,
            child: FutureBuilder(
              future: controller.obterPrestadores(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                      child: Text('Nenhum prestador localizado'),
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

                return ListView.builder(
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final PrestadorModel prestador = snapshot.data[index];
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 15),
                        width: Get.width * 0.90,
                        child: Card(
                          elevation: 1,
                          color: Color(0XFFF6F6F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            height: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  prestador.nome,
                                  style: TextStyle(
                                      color: MainTheme.backgroundColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  prestador.endereco,
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
                                    FutureBuilder(
                                      future: controller
                                          .obterEspecialidadesPrestador(
                                              prestador.codPrestador),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                      Color>(Colors.teal),
                                            ),
                                          );
                                        }
                                        final EspecialidadePrestadorModel
                                            especialidade = snapshot.data[0];
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Text(especialidade.descricao,
                                              style: TextStyle(
                                                color: Color(0XFF7B9EB1),
                                                fontSize: 14,
                                              ));
                                        }
                                        return Text('');
                                      },
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
                                    for (var telefone in prestador.telefones)
                                      Text(
                                        telefone.numero,
                                        style: TextStyle(
                                          color: Color(0XFF7B9EB1),
                                          fontSize: 14,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return CircularProgressIndicator();
                  },
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
                final controller = Get.find<ReferencedSearchController>();
                controller.codBairro.value = '';
                controller.nomeBairro.value = '';
                controller.codCidade.value = '';
                controller.nomeCidade.value = '';
                controller.codEspecialidade.value = '';
                controller.nomeEspecialidade.value = '';

                Get.toNamed(Routes.REFERENCED_SEARCH);
              },
            ),
          )
        ],
      ),
    );
  }
}
