import 'package:app_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_hortifruti_pratico/app/data/provider/models/estabelecimento.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<EstabelecimentoModel>> getEstabelecimentos() {
    return _api.getEstabelecimentos();
  }
}
