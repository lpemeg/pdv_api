import 'package:mysql_client/mysql_client.dart';

class Conexao {
  final String url = "gabtechinfo.com";
  final int porta = 3306;
  final String usuario = "gabtech_pdv";
  final String senha = "Aula2024()";
  final int maximoConexoes = 10;
  final String banco = "gabtech_pdv_aula";

  Future<MySQLConnection> conectar() async {
    try {
      final pool = await MySQLConnection.createConnection(
        host: url,
        port: porta,
        userName: usuario,
        password: senha,
        databaseName: banco,
      );

      return pool;
    } catch (e) {
      throw Exception("Erro ao conectar $e");
    }
  }
}
