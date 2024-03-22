import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/components/global.dart';
import 'package:pdv_api/controller/home/home_controller.dart';
import 'package:pdv_api/controller/usuario/lista_usuario_controller.dart';

class ListaUsuarioView extends StatelessWidget {
  ListaUsuarioView({super.key});

  final luCtl = Get.put(ListaUsuarioController());
  final homeCtl = Get.find<HomeController>();
  final global = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Lista de Usuários'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  luCtl.listaUsuario();
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  homeCtl.intBody.value = 11;
                  Get.forceAppUpdate();
                },
              ),
            ],
          ),
          const Divider(),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: luCtl.usuario.length,
                itemBuilder: (context, index) {
                  if (luCtl.usuario.isEmpty) {
                    return const ListTile(
                      title: Text('Nenhum usuário encontrado'),
                    );
                  }

                  final usuario = luCtl.usuario[index];

                  return ListTile(
                    title: Text(usuario.nome ?? ''),
                    subtitle: Text(usuario.email ?? ''),
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      global.usuario.value = usuario;
                      homeCtl.intBody.value = 11;
                      Get.forceAppUpdate();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
