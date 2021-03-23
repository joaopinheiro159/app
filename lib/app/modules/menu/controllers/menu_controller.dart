import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/dependentes_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/repositories/user_repository.dart';
import 'package:klinimed_app/app/shared/controllers/user_controller.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:klinimed_app/app/shared/helpers/messages_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuController extends GetxController
    with LoaderMixin, MessagesMixin, StateMixin {
  final UserController _userController =
      Get.put<UserController>(UserController());
  final UserRepository _repository;

  final loading = false.obs;
  final message = Rx<MessageModel>();

  List<BeneficiarioModel> _beneficiarios = [];

  List<BeneficiarioModel> get beneficiarios => _beneficiarios;

  MenuController(this._repository);

  UserModel get user => _userController.user;
  BeneficiarioModel get beneficiario => _userController.beneficiario;

  @override
  void onInit() {
    super.onInit();

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
    final dependentes = await _repository.getDependents(
        Get.parameters['codbeneficiario'], user.token);

    for (var dep in dependentes.dependente) {
      print(dep.codigoAssociado);
      final informacoesBeneficiario =
          await _repository.obterBeneficiario(dep.codigoAssociado, user.token);

      _beneficiarios.add(informacoesBeneficiario);
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
