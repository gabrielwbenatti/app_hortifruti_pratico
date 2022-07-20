import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: FlutterLogo(),
          title: Text(
            'Horti-verde',
          ),
          trailing: Text('Aberto'),
        ),
      ],
    );
  }
}
