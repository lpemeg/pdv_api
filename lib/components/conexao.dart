import 'package:mysql_client/mysql_client.dart';

class Conexao {
  final String url = "host";
  final int porta = 3306;
  final String usuario = "nome de usuario";
  final String senha = "senha";
  final int maximoConexoes = 10;
  final String banco = "banco de dados";

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
