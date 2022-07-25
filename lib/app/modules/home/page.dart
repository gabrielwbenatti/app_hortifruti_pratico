import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_hortifruti_pratico/app/widgets/estabelecimento_status.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
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
                onTap: () => Get.toNamed(
                  Routes.estabelecimento.replaceFirst(
                    ':id',
                    estabelecimento.id.toString(),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: Container(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: estabelecimento.image,
                    ),
                  ),
                ),
                title: Text(estabelecimento.nome),
                trailing: EstabelecimentoStatus(estabelecimento.isOnline),
              )
          ],
        ),
        // onError: (error) => const Padding(
        //   padding: EdgeInsets.all(16.0),
        //   child: Center(
        //     child: Text(
        //       'Não foi possível localizar os estabelecimentos, tente novamente.',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         fontSize: 18.0,
        //       ),
        //     ),
        //   ),
        // ),

        onEmpty: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'Nenhum estabelecimento localizado.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
