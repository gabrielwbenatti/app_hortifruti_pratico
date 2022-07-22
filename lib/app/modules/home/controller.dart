import 'package:app_hortifruti_pratico/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getEstabelecimentos().then((data) {
      change(
        data,
        status: RxStatus.success(),
      );
    });

    super.onInit();
  }
}
