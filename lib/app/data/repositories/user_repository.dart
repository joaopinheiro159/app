import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String cpf, String senha) async {
    var response;
    response = await restClient.post(
      '/usuario/efetuarlogin',
      {'Cpf': cpf, 'Senha': senha},
      decoder: (resp) {
        print('resposta foi $resp');
        if (resp['CodRetorno'] != 0) {
          String message = resp['MsgRetorno'];

          throw Exception(message);
        }

        return UserModel.fromMap(resp);
      },
    );

    if (response.hasError) {
      String message = response.toString();

      // tratar erro de senha
      //if (response.statusCode == 403) {}

      throw RestClientException(message);
    }

    return response.body;
  }
}
