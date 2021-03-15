import 'package:get/get.dart';
import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/shared/helpers/loader_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController with LoaderMixin {
  final _user = Rx<UserModel>();
  final _beneficiario = Rx<BeneficiarioModel>();

  UserModel get user => _user.value;
  BeneficiarioModel get beneficiario => _beneficiario.value;

  @override
  Future<void> onInit() async {
    print('=======================');
    print('USERCONTROLLER iniciado');
    print('=======================');

    super.onInit();
    final sp = await SharedPreferences.getInstance();

    if (sp.containsKey('user') && sp.containsKey('beneficiario')) {
      _user(UserModel.fromJson(sp.getString('user')));
      _beneficiario(BeneficiarioModel.fromJson(sp.getString('beneficiario')));
    }
  }
}
