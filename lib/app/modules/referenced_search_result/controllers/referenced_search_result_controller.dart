import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/prestador_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

import 'package:klinimed_app/app/data/repositories/prestador_repository.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferencedSearchResultController extends GetxController
    with LoaderMixin, MessagesMixin, StateMixin {
  final PrestadorRepository _repository;

  final loading = false.obs;
  final message = Rx<MessageModel>();
  List<PrestadorModel> _prestadores = [];

  List<PrestadorModel> get prestadores => _prestadores;

  ReferencedSearchResultController(this._repository);

  @override
  void onInit() {
    super.onInit();

    print('codCidade: ${Get.parameters['codCidade']}');
    print('codBairro: ${Get.parameters['codBairro']}');
    print('codEspecialidade: ${Get.parameters['codEspecialidade']}');

    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    print('chamei o close');
  }

  Future<List<PrestadorModel>> obterPrestadores() async {
    final sp = await SharedPreferences.getInstance();

    final userLogged = UserModel.fromJson(sp.getString('user'));

    final headers = {
      'contentType': 'application/json',
    };

    var response = await Dio().get(
        "https://vipriosaude-api-mob-beneficiario.topsaude.com.br/Api/v1/Beneficiario/redecredenciada/prestadores?CodTs=${userLogged.planos[0].codBeneficiario}&IndTipo=M&Especialidades=${Get.parameters['codEspecialidade']}&CodBairro=${Get.parameters['codBairro']}&Pagina=1&QtdRegistrosPagina=1000",
        options: Options(headers: headers));

    if (response.data['CodRetorno'] == 3) {
      Get.back();

      message(MessageModel('Aviso', 'Nenhuma informação encontrada'));

      return null;
    }

    var prestadores = (response.data['Prestadores'] as List).map((item) {
      return PrestadorModel.fromJson(item);
    }).toList();

    return prestadores;

    // PrestadorModel models = PrestadorModel.fromMap(response.data);
    // models.prestadores.map((e) => )
  }

  // Future<void> loadPrestadores() async {
  //   change([], status: RxStatus.loading());

  //   try {
  //     change(_prestadores = await obterPrestadores(),
  //         status: RxStatus.success());
  //   } catch (e) {
  //     change([], status: RxStatus.error('Erro ao obter prestadores'));
  //   }
  // }
}
