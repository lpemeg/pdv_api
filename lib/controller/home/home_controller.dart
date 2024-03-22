import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/view/usuario/cad_usuario_view.dart';
import 'package:pdv_api/view/usuario/lista_usuario_view.dart';

class HomeController extends GetxController {
  RxBool isDrawerOpen = false.obs;
  RxInt intBody = 0.obs;

  Widget getBody() {
    switch (intBody.value) {
      case 0:
        return const Center(
          child: Text('Inicio'),
        );
      case 1:
        return ListaUsuarioView();
      case 11:
        return CadUsuarioView();
      case 2:
        return const Center(
          child: Text('Produtos'),
        );
      case 3:
        return const Center(
          child: Text('Vendas'),
        );
      default:
        return const Center(
          child: Text('Inicio'),
        );
    }
  }
}
