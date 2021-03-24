import 'package:klinimed_app/app/data/models/beneficiario_model.dart';
import 'package:klinimed_app/app/data/models/change_password_model.dart';
import 'package:klinimed_app/app/data/models/dependentes_model.dart';
import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String cpf, String senha) async {
    var errorMessage = '';
    final response = await restClient.post(
      '/usuario/efetuarlogin',
      {'Cpf': cpf, 'Senha': senha},
      decoder: (resp) {
        print('resposta foi $resp');
        if (resp['CodRetorno'] == 0) {
          return UserModel.fromMap(resp);
        }

        errorMessage = resp['MsgRetorno'];
      },
    );

    if (errorMessage != '') {
      throw RestClientException(errorMessage);
    }

    return response.body;
  }

  Future<BeneficiarioModel> obterBeneficiario(
      String codBeneficiario, String token) async {
    final response = await restClient.get(
      '/Beneficiario/ObterInformacoesBeneficiario/$codBeneficiario',
      headers: {
        'contentType': 'application/json',
        'Authorization': 'Bearer $token'
      },
      decoder: (resp) {
        print('resposta foi $resp');
        if (resp['CodRetorno'] != 0) {
          String message = resp['MsgRetorno'];

          throw Exception(message);
        }

        return BeneficiarioModel.fromMap(resp);
      },
    );

    if (response.hasError) {
      String message = response.toString();

      throw RestClientException(message);
    }

    return response.body;
  }

  Future<DependentesModel> getDependents(
      String codBeneficiario, String token) async {
    final response = await restClient.get(
      '/Beneficiario/ObterDependentes/$codBeneficiario',
      headers: {
        'contentType': 'application/json',
        'Authorization': 'Bearer $token'
      },
      decoder: (resp) {
        print('resposta foi $resp');
        if (resp['CodRetorno'] != 0) {
          String message = resp['MsgRetorno'];

          throw Exception(message);
        }

        return DependentesModel.fromMap(resp);
      },
    );

    if (response.hasError) {
      String message = response.toString();

      throw RestClientException(message);
    }

    return response.body;
  }

  Future<bool> changePassword(String cpf, String currentPassword,
      String newPassword, String token) async {
    final response = await restClient.post('/usuario/AlterarSenha', {
      'Cpf': cpf,
      'SenhaAtual': currentPassword,
      'NovaSenha': newPassword
    }, headers: {
      'contentType': 'application/json',
      'Authorization': 'Bearer $token'
    }, decoder: (body) {
      if (body['CodRetorno'] == 1) {
        return false;
      }
      return true;
    });

    if (response.hasError) {
      throw Exception('Erro ao buscar usuários');
    }

    return response.body;
  }
}

  // Future<ChangePasswordModel> changePassword(String cpf, String currentPassword,
  //     String newPassword, String token) async {
  //   final response = await restClient.post(
  //     '/usuario/AlterarSenha',
  //     {'Cpf': cpf, 'SenhaAtual': currentPassword, 'NovaSenha': newPassword},
  //     headers: {
  //       'contentType': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //     decoder: (resp) {
  //       print('resposta foi $resp');
  //       if (resp['CodRetorno'] != 0) {
  //         return ChangePasswordModel.fromMap(resp);
  //       }

  //       return ChangePasswordModel.fromMap(resp);
  //     },
  //   );

  //   if (response.hasError) {
  //     String message = response.toString();

  //     throw RestClientException(message);
  //   }

  //   return response.body;
  // }

