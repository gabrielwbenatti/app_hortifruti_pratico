import 'package:app_hortifruti_pratico/app/data/models/estabelecimento.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_hortifruti_pratico/app/data/models/estabelecimento.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<EstabelecimentoModel>> getEstabelecimentos() =>
      _api.getEstabelecimentos();
}
