import 'package:app_hortifruti_pratico/app/modules/produto/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdutoPage extends GetView<ProdutoController> {
  const ProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.produto.value!.nome,
        ),
      ),
      body: const SafeArea(
        child: Text('ProdutoController'),
      ),
    );
  }
}
