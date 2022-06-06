import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  TextEditingController mensaje = TextEditingController();
  String tipoUsuario() {
    var storage = GetStorage();
    String? usuarioTipo = storage.read<String>('usuarioTipo');

    return usuarioTipo!;
  }

  Future<String> enviarMensaje(String tipoUsuario) async {
    return '';
  }
}
