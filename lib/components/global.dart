import 'package:get/get.dart';
import 'package:pdv_api/model/usuario/usuario.dart';

class GlobalController extends GetxController {
  late Rx<Usuario> usuarioLogado = Usuario().obs;

  late Rx<Usuario> usuario = Usuario().obs;
}
