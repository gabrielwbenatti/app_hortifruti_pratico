import 'package:app_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_hortifruti_pratico/app/data/models/estabelecimento.dart';
import 'package:meta/meta.dart';

class EstabelecimentoRepository {
  final Api _api;

  EstabelecimentoRepository(this._api);

  Future<EstabelecimentoModel> getEstabelecimento(int id) =>
      _api.getEstabelecimento(id);
}
