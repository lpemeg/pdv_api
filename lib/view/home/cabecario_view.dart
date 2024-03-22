import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/view/home/perfil_card_view.dart';

class CabecarioView extends StatelessWidget {
  const CabecarioView({super.key});

  _alterarTema() {
    if (Get.theme.brightness == Brightness.light) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      height: 60,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'PDV',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          PerfilCardView(),
          IconButton(
            onPressed: _alterarTema,
            icon: Icon(
              Get.theme.brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
    );
  }
}
