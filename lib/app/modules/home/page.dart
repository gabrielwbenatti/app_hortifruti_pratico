import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hortifruti Pratico')),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var estabelecimento in state!)
              ListTile(
                leading: const FlutterLogo(),
                title: Text(estabelecimento.nome),
                trailing: Text(estabelecimento.isOnline ? 'Aberto' : 'Fechado'),
              )
          ],
        ),
      ),
    );
  }
}
