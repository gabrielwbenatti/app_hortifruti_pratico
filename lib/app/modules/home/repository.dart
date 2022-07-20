
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class HomeRepository {
  
final Api _api;

HomeRepository(this._api);

getEstabelecimentos(){
  return _api.getEstabelecimentos();
}

}