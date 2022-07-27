import 'package:app_hortifruti_pratico/app/modules/produto/controller.dart';
import 'package:get/get.dart';

class ProdutoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutoController>(() => ProdutoController());
  }
}
