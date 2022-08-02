import 'package:app_hortifruti_pratico/app/modules/produto/widgets/quantidade_e_peso_widget.dart';
import 'package:intl/intl.dart';
import 'package:app_hortifruti_pratico/app/modules/produto/controller.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var produto = controller.produto.value!;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              if (produto.imagem != null)
                Align(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: produto.imagem!,
                      ),
                    ),
                  ),
                ),
              if (produto.descricao != null)
                Text(
                  produto.descricao!,
                  style: Get.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              Text(
                NumberFormat.simpleCurrency().format(produto.preco) +
                    (produto.isKG ? '/kg' : ''),
                style: Get.textTheme.titleLarge,
              ),
              TextField(
                controller: controller.observationController,
                decoration: const InputDecoration(
                  labelText: 'Observação',
                ),
                maxLength: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black12, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Altere a quantidade',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    QuantidadeEPesoWidget(isKg: produto.isKG),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () => controller.addToCart(),
                  child: const Text('Adicionar ao Carrinho'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
