import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantidadeEPesoWidget extends StatelessWidget {
  final bool isKg;

  const QuantidadeEPesoWidget({
    this.isKg = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantidadeEPesoController>(
      init: QuantidadeEPesoController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          QuantidadeWidget(),
        ],
      ),
    );
  }
}

class QuantidadeWidget extends StatelessWidget {
  var controller = Get.find<QuantidadeEPesoController>();

  QuantidadeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quantidade = controller.quantidade;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => controller.mudarQuantidade(quantidade - 1),
            child: const Icon(Icons.remove)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '$quantidade',
            style: Get.textTheme.titleLarge,
          ),
        ),
        ElevatedButton(
            onPressed: () => controller.mudarQuantidade(quantidade + 1),
            child: const Icon(Icons.add)),
        // ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
      ],
    );
  }
}

class PesoWidget extends StatelessWidget {
  const PesoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class QuantidadeEPesoController extends GetxController {
  bool isKg;

  QuantidadeEPesoController({required this.isKg});

  num quantidade = 1;

  void mudarQuantidade(num value) {
    if (value > 0) {
      quantidade = value;
      update();
    }
  }
}
