import 'package:intl/intl.dart';
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
          if (isKg) ...[
            const SizedBox(height: 4.0),
            PesoWidget(),
          ],
        ],
      ),
    );
  }
}

class QuantidadeWidget extends StatelessWidget {
  final controller = Get.find<QuantidadeEPesoController>();

  QuantidadeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quantidade = controller.quantidade;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: quantidade > 1
                ? () => controller.mudarQuantidade(quantidade - 1)
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              minimumSize: const Size(45, 45),
            ),
            child: const Icon(Icons.remove)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            NumberFormat.decimalPattern().format(quantidade) +
                (controller.isKg ? 'kg' : ''),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.mudarQuantidade(quantidade + 1),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(45, 45),
          ),
          child: const Icon(Icons.add),
        ),
        // ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
      ],
    );
  }
}

class PesoWidget extends StatelessWidget {
  final controller = Get.find<QuantidadeEPesoController>();

  PesoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: controller.mudarPeso,
      value: controller.peso,
      min: 1.0,
      max: 2.0,
      divisions: 19,
    );
  }
}

class QuantidadeEPesoController extends GetxController {
  bool isKg;

  QuantidadeEPesoController({required this.isKg});

  num quantidade = 1;
  double get peso => quantidade.toDouble();

  void mudarQuantidade(num value) {
    quantidade = value;
    update();
  }

  void mudarPeso(double value) {
    quantidade = value;
    update();
  }
}
