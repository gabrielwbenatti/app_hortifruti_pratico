import 'package:app_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/controller.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/repository.dart';
import 'package:get/get.dart';

class EstabelecimentoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstabelecimentoController>(
      () =>
          EstabelecimentoController(EstabelecimentoRepository(Get.find<Api>())),
    );
  }
}
