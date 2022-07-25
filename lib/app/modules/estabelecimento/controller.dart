import 'package:app_hortifruti_pratico/app/data/provider/models/estabelecimento.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EstabelecimentoController extends GetxController
    with StateMixin<EstabelecimentoModel> {
  final EstabelecimentoRepository _repository;

  EstabelecimentoController(this._repository);

  @override
  void onInit() {
    int id = int.parse(Get.parameters['id']!);

    _repository.getEstabelecimento(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(
        null,
        status: RxStatus.error(error.toString()),
      );
    });

    super.onInit();
  }
}
