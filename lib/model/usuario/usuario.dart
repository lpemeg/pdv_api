import 'dart:convert';

import 'package:flutter/foundation.dart';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? senha;
  Uint8List? foto;

  Usuario({this.id, this.nome, this.email, this.senha, this.foto});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? 0 : int.parse(json['id']);
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    foto = json['foto'] == null ? Uint8List(0) : base64Decode(json['foto']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;
    data['foto'] = foto == null ? null : base64Encode(foto!);
    return data;
  }
}
