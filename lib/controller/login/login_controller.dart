import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_api/components/conexao.dart';
import 'package:pdv_api/components/global.dart';
import 'package:pdv_api/model/usuario/usuario.dart';
import 'package:pdv_api/view/home/inicio_view.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final globalCtl = Get.find<GlobalController>();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  login() async {
    final conexao = await Conexao().conectar();

    try {
      if (!formKey.currentState!.validate()) {
        return;
      }

      await conexao.connect();

      var resultado = await conexao.execute(
        'SELECT * FROM usuario WHERE email = :email AND senha = :senha',
        {
          'email': emailController.text,
          'senha': senhaController.text,
        },
      );

      if (resultado.rows.isNotEmpty) {
        globalCtl.usuarioLogado.value =
            Usuario.fromJson(resultado.rows.first.assoc());
        Get.offAll(() => InicioView());
      } else {
        Get.snackbar(
          'Atenção!',
          'Usuário ou senha inválidos',
          backgroundColor: Colors.red.withOpacity(.3),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      debugPrint('Erro ao fazer login: $e');
    } finally {
      conexao.connected ? conexao.close() : null;
    }
  }
}
