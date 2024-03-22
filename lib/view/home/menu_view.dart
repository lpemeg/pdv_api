import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/controller/home/home_controller.dart';

class MenuView extends StatelessWidget {
  MenuView({super.key});

  final HomeController homeCtl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('PDV'),
          ),
          ListTile(
            title: const Text('Início'),
            onTap: () {
              homeCtl.intBody.value = 0;
              Get.forceAppUpdate();
            },
          ),
          ListTile(
            title: const Text('Usuario'),
            onTap: () {
              homeCtl.intBody.value = 1;
              Get.forceAppUpdate();
            },
          ),
          ListTile(
            title: const Text('Produtos'),
            onTap: () {
              homeCtl.intBody.value = 2;
              Get.forceAppUpdate();
            },
          ),
          ListTile(
            title: const Text('Vendas'),
            onTap: () {
              homeCtl.intBody.value = 3;
              Get.forceAppUpdate();
            },
          ),
        ],
      ),
    );
  }
}
