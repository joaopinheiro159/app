import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/bairro_model.dart';
import 'package:klinimed_app/app/data/models/cidade_model.dart';
import 'package:klinimed_app/app/data/models/especialidade_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferencedSearchController extends GetxController {
  RxString _codCidade = ''.obs;
  RxString _codBairro = ''.obs;

  RxString get codCidade => _codCidade;
  RxString get codBairro => _codBairro;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<CidadeModel>> getCidades() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Beneficiario/redecredenciada/cidades?codTs=${userLogged.planos[0].codBeneficiario}&indTipo=M&uF=RJ",
        options: Options(headers: headers));

    var models = CidadeModel.fromJsonList(response.data['ListaCidades']);
    return models;
  }

  Future<List<BairroModel>> getBairros() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Beneficiario/redecredenciada/bairros?codTs=${userLogged.planos[0].codBeneficiario}&indTipo=M&uF=RJ&CodCidade=$_codCidade",
        options: Options(headers: headers));

    var models = BairroModel.fromJsonList(response.data['ListaBairros']);
    return models;
  }

  Future<List<EspecialidadeModel>> getEspecialidade() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Beneficiario/redecredenciada/especialidades?codTs=${userLogged.planos[0].codBeneficiario}&IndTipo=M&IndCoordenada=N&CodBairro=$_codBairro",
        options: Options(headers: headers));

    var models =
        EspecialidadeModel.fromJsonList(response.data['ListaEspecialidades']);
    return models;
  }
}
