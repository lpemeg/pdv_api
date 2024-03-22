import 'package:get/get.dart';
import 'package:pdv_api/components/conexao.dart';
import 'package:pdv_api/model/usuario/usuario.dart';

class ListaUsuarioController extends GetxController {
  final _usuario = <Usuario>[].obs;
  final _usuarioSelecionado = Usuario().obs;

  List<Usuario> get usuario => _usuario;
  Usuario get usuarioSelecionado => _usuarioSelecionado.value;

  @override
  void onInit() async {
    super.onInit();
    await listaUsuario();
  }

  void onSelected(Usuario usuario) {
    _usuarioSelecionado.value = usuario;
  }

  listaUsuario() async {
    final conexao = await Conexao().conectar();
    try {
      await conexao.connect();

      var resultado = await conexao.execute('SELECT * FROM usuario');

      _usuario.value =
          resultado.rows.map((e) => Usuario.fromJson(e.assoc())).toList();
    } catch (e) {
      print('Erro ao listar usuários: $e');
    } finally {
      conexao.connected ? conexao.close() : null;
    }
  }
}
