import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/components/global.dart';
import 'package:pdv_api/components/responsivo.dart';

class PerfilCardView extends StatelessWidget {
  PerfilCardView({super.key});

  final globalCtl = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsivo.isMobile(context);
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: isMobile
          ? null
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.primaryColor),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 20,
              foregroundColor: theme.cardColor,
              child: const Icon(Icons.person),
            ),
          ),
          if (!isMobile)
            Container(
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                globalCtl.usuarioLogado.value.nome ?? '',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('Perfil'),
                ),
                const PopupMenuItem(
                  child: Text('Sair'),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
