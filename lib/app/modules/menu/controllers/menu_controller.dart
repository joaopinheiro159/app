import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/dependentes_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/modules/login/controllers/login_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuController extends GetxController
    with LoaderMixin, MessagesMixin, StateMixin {
  final UserController _userController =
      Get.put<UserController>(UserController());
  final UserRepository _repository;

  final LoginController _loginController = Get.put(LoginController(Get.find()));

  final loading = false.obs;
  final message = Rx<MessageModel>();

  List<BeneficiarioModel> _beneficiarios = [];
  List<DependentesModel> dependentes = [];

  List<BeneficiarioModel> get beneficiarios => _beneficiarios;

  MenuController(this._repository);

  UserModel get user => _userController.user;
  BeneficiarioModel get beneficiario => _userController.beneficiario;

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    messageListener(message);

    print(Get.parameters['codbeneficiario']);

    loadUserDetails();
    //obterDependentes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<DependentesModel> obterDependentes() async {
    try {
      final sp = await SharedPreferences.getInstance();

      final userLogged = UserModel.fromJson(sp.getString('user'));

      final dependentes = await _repository.getDependents(
          Get.parameters['codbeneficiario'], userLogged.token);

      print(dependentes);

      final beneficiarioAtual = await _repository.obterBeneficiario(
          Get.parameters['codbeneficiario'], userLogged.token);

      _beneficiarios.add(beneficiarioAtual);

      if (dependentes.dependente != null) {
        for (var dep in dependentes.dependente) {
          print(dep.codigoAssociado);
          final informacoesBeneficiario = await _repository.obterBeneficiario(
              dep.codigoAssociado, userLogged.token);

          _beneficiarios.add(informacoesBeneficiario);
        }
      }
    } on RestClientException catch (e) {
      print(e);

      final sp = await SharedPreferences.getInstance();

      final cpf = sp.getString('cpf');
      final senha = sp.getString('senha');

      // renova login com dados armazenados
      await _loginController.renewToken(cpf, senha);

      message(MessageModel('Aviso',
          'Para garantirmos a sua segurança, seu acesso expirou e suas credenciais foram renovadas. Tente novamente.'));
    } catch (e) {
      print(e);
      message(MessageModel(
          'Alerta', 'Erro ao obter informações. Tente novamente.'));
    }
  }

  Future<void> loadUserDetails() async {
    change([], status: RxStatus.loading());

    try {
      change(await obterDependentes(), status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }
}
