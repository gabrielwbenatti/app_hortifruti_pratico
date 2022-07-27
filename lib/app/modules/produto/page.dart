import 'package:app_hortifruti_pratico/app/modules/produto/controller.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var produto = controller.produto.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          produto!.nome,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              if (produto.imagem!.isNotEmpty)
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
            ],
          ),
        ),
      ),
    );
  }
}
