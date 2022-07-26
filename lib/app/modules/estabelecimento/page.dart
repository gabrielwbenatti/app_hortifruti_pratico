import 'package:app_hortifruti_pratico/app/widgets/estabelecimento_status.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstabelecimentoPage extends GetView<EstabelecimentoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: controller.obx(
          (state) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              Row(
                children: [
                  Container(
                    width: 96.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: state!.image,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${state.nome}, ${state.id}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Get.textTheme.headline5,
                        ),
                        EstabelecimentoStatus(state.isOnline),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
