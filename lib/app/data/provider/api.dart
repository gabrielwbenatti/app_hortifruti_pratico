import 'package:app_hortifruti_pratico/app/data/provider/models/estabelecimento.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.15.9:3333/';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });
    super.onInit();
  }

  Future<List<EstabelecimentoModel>> getEstabelecimentos() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));

    List<EstabelecimentoModel> data = [];
    for (var estabelecimento in response.body) {
      data.add(EstabelecimentoModel.fromJson(estabelecimento));
    }

    return data;
  }

  Future<EstabelecimentoModel> getEstabelecimento(int id) async {
    var response = _errorHandler(await get('estabelecimentos/$id}'));

    return EstabelecimentoModel.fromJson(response.body);
  }

  Response _errorHandler(Response response) {
    print(response.bodyString);

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro';
    }
  }
}
