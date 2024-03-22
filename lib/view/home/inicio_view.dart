import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/components/responsivo.dart';
import 'package:pdv_api/controller/home/home_controller.dart';
import 'package:pdv_api/view/home/cabecario_view.dart';
import 'package:pdv_api/view/home/menu_view.dart';
import 'package:pdv_api/view/home/rodape_view.dart';

class InicioView extends StatelessWidget {
  InicioView({super.key});

  final HomeController homeCtl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuView(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!Responsivo.isMobile(context)) MenuView(),
                Expanded(
                  child: Column(
                    children: [
                      const CabecarioView(),
                      Expanded(
                        child: homeCtl.getBody(),
                      ),
                      const RodapeView(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
