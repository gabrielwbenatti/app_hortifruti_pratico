import 'package:app_hortifruti_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/dashboard/page.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/estabelecimento/page.dart';
import 'package:app_hortifruti_pratico/app/modules/produto/binding.dart';
import 'package:app_hortifruti_pratico/app/modules/produto/page.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.estabelecimento,
        page: () => const EstabelecimentoPage(),
        binding: EstabelecimentoBinding()),
    GetPage(
        name: Routes.produto,
        page: () => const ProdutoPage(),
        binding: ProdutoBinding()),
  ];
}
