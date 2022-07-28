import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:app_hortifruti_pratico/app/widgets/estabelecimento_status.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstabelecimentoPage extends GetView<EstabelecimentoController> {
  const EstabelecimentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 96.0,
                        height: 96.0,
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
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var categoria = state.categorias[index];

                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  categoria.nome,
                                  style: Get.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (var produto in categoria.produtos)
                          ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                              NumberFormat.simpleCurrency()
                                      .format(produto.preco) +
                                  (produto.isKG ? '/kg' : ''),
                            ),
                            leading: (produto.imagem != null)
                                ? SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: produto.imagem!,
                                        imageErrorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                          width: 56.0,
                                          height: 56.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                            onTap: () => Get.toNamed(
                              Routes.produto,
                              arguments: {
                                'produto': produto,
                                'estabelecimento': state,
                              },
                            ),
                          ),
                      ],
                    );
                  },
                  childCount: state.categorias.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
