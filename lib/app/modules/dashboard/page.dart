import 'package:app_hortifruti_pratico/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DashboardPage')),
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              children: [
                Text('inicio'),
                Text('perfil'),
                Text('pedidos'),
              ],
              index: controller.currentPageIndex.value,
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: controller.currentPageIndex.value,
            onDestinationSelected: controller.changePageIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Inicio',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                selectedIcon: Icon(Icons.person),
                label: 'Meu Perfil',
              ),
              NavigationDestination(
                icon: Icon(Icons.view_list_outlined),
                selectedIcon: Icon(Icons.view_list),
                label: 'Pedidos',
              ),
            ],
          ),
        ));
  }
}
