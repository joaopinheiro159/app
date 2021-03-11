import 'package:klinimed_app/app/data/models/user_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String cpf, String senha) async {
    final response = await restClient.post(
      '/usuario/efetuarlogin',
      {
        'Cpf': cpf,
        'Senha': senha,
      },
      decoder: (resp) => UserModel.fromMap(resp),
    );

    if (response.hasError) {
      String message = 'Erro ao autenticar o usuário';

      // tratar erro de senha
      //if (response.statusCode == 403) {}

      throw RestClientException(message);
    }

    return response.body;
  }
}
