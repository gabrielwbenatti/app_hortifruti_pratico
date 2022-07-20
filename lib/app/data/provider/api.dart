import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://127.0.0.1/';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });
    super.onInit();
  }

  Future<List> getEstabelecimentos() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));

    return response.body;
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
