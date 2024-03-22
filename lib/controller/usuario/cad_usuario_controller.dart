import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdv_api/components/conexao.dart';
import 'package:pdv_api/components/global.dart';
import 'package:pdv_api/model/usuario/usuario.dart';

class CadUsuarioController extends GetxController {
  late RxInt idUsuario = 0.obs;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senhaConfirmaController = TextEditingController();
  late var fotoController = Uint8List(0).obs;
  final ImagePicker _picker = ImagePicker();

  final formKey = GlobalKey<FormState>();
  final global = Get.find<GlobalController>();

  @override
  void onInit() {
    super.onInit();
    if (global.usuario.value.id != null) {
      idUsuario.value = global.usuario.value.id ?? 0;
      nomeController.text = global.usuario.value.nome ?? '';
      emailController.text = global.usuario.value.email ?? '';
      senhaController.text = global.usuario.value.senha ?? '';
      fotoController.value = global.usuario.value.foto ?? Uint8List(0);

      global.usuario.value = Usuario();
    }
  }

  Future<void> setImagem(ImageSource imSo) async {
    try {
      final XFile? xFile = await _picker.pickImage(
        source: imSo,
        maxWidth: 128,
        maxHeight: 128,
        imageQuality: 50,
      );

      File foto = File(xFile!.path);

      fotoController.value = foto.readAsBytesSync();
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro ao carregar imagem',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void inserir() async {
    final conexao = await Conexao().conectar();
    try {
      await conexao.connect();

      if (idUsuario.value != 0 && formKey.currentState!.validate()) {
        await conexao.execute(
          'UPDATE usuario SET nome = :nome, email = :email, senha = :senha, foto = :foto WHERE id = :id',
          {
            'id': idUsuario.value,
            'nome': nomeController.text,
            'email': emailController.text,
            'senha': senhaController.text,
            'foto': fotoController.value.isEmpty
                ? null
                : base64Encode(fotoController.value),
          },
        );
        Get.snackbar(
          'Sucesso',
          'Usuário atualizado com sucesso',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return;
      }

      if (formKey.currentState!.validate()) {
        await conexao.execute(
          'INSERT INTO usuario (nome, email, senha, foto) VALUES (:nome, :email, :senha, :foto)',
          {
            'nome': nomeController.text,
            'email': emailController.text,
            'senha': senhaController.text,
            'foto': fotoController.value,
          },
        );
        Get.snackbar(
          'Sucesso',
          'Usuário inserido com sucesso',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro ao inserir usuário',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      conexao.connected ? conexao.close() : null;
    }
  }

  void excluir() async {
    final conexao = await Conexao().conectar();
    try {
      await conexao.connect();

      await conexao.execute(
        'DELETE FROM usuario WHERE id = :id',
        {
          'id': idUsuario.value,
        },
      );
      Get.snackbar(
        'Sucesso',
        'Usuário excluído com sucesso',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Erro ao excluir usuário',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      conexao.connected ? conexao.close() : null;
    }
  }
}
