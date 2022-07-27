import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class ProdutoRepository {
  final Api _api;

  ProdutoRepository(this._api);

  getAll() {
    return _api.getEstabelecimentos();
  }
}
