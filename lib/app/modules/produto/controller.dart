import 'package:app_hortifruti_pratico/app/data/models/estabelecimento.dart';
import 'package:app_hortifruti_pratico/app/data/models/produto.dart';
import 'package:app_hortifruti_pratico/app/modules/produto/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController {
  final produto = Rxn<ProdutoModel>();
  final estabelecimento = Rxn<EstabelecimentoModel>();
  final observationController = TextEditingController();

  @override
  void onInit() {
    produto.value = Get.arguments['produto'];
    estabelecimento.value = Get.arguments['estabelecimento'];

    super.onInit();
  }

  void addToCart() {
    observationController.text.trim();
  }
}
