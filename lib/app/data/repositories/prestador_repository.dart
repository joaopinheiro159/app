import 'package:klinimed_app/app/data/models/prestador_model.dart';
import 'package:klinimed_app/app/data/providers/rest_client.dart';

class PrestadorRepository {
  final RestClient restClient;

  PrestadorRepository(this.restClient);

  // Future<PrestadorModel> obterPrestadores(String codBeneficiario,
  //     String codCidade, String codBairro, String codEspecialidade) async {
  //   dynamic response = await restClient.get(
  //     '/Beneficiario/redecredenciada/prestadores?CodTs=$codBeneficiario&IndTipo=M&Especialidades=$codEspecialidade&CodBairro=$codBairro&Pagina=1&QtdRegistrosPagina=1000',
  //     headers: {
  //       'contentType': 'application/json',
  //     },
  //     decoder: (resp) {
  //       print('resposta foi $resp');
  //       if (resp['CodRetorno'] != 0) {
  //         String message = resp['MsgRetorno'];

  //         throw Exception(message);
  //       }

  //       return PrestadorModel.fromMap(resp);
  //     },
  //   );

  //   if (response.hasError) {
  //     String message = response.toString();

  //     throw RestClientException(message);
  //   }

  //   return response.body;
  // }

  // Future<PrestadorModel> obterPrestadores(String codBeneficiario,
  //     String codCidade, String codBairro, String codEspecialidade) async {
  //   final response = await restClient.get(
  //     '/Beneficiario/redecredenciada/prestadores?CodTs=$codBeneficiario&IndTipo=M&Especialidades=$codEspecialidade&CodBairro=$codBairro&Pagina=1&QtdRegistrosPagina=1000',
  //     headers: {
  //       'contentType': 'application/json',
  //     },
  //     decoder: (resp) {
  //       print('resposta foi $resp');
  //       if (resp['CodRetorno'] != 0) {
  //         String message = resp['MsgRetorno'];

  //         throw Exception(message);
  //       }

  //       return PrestadorModel.fromMap(resp);
  //     },
  //   );

  //   if (response.hasError) {
  //     String message = response.toString();

  //     throw RestClientException(message);
  //   }

  //   return response.body;
  // }
}
