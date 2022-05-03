import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';

class LoginController extends GetxController {
  final autentificacionProvider = Get.find<AutentificacionProvider>();
  final pacienteProvider = Get.find<PacienteProvider>();
  final medicoProvider = Get.find<MedicoProvider>();

  bool isLoading = false;

  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController();

  Future<Map<String, dynamic>> login() async {
    cargando(true);
    try {
      Map<String, dynamic> isLoged =
          await autentificacionProvider.login(correo.text, password.text);

      if (isLoged["login"] == true) {
        // averiguar que tipo de usuario es
        bool pacienteExiste =
            await pacienteProvider.pacienteExiste(isLoged["id"]);
        bool medicoExiste = await medicoProvider.pacienteExiste(isLoged["id"]);
        var storage = GetStorage();
        if (pacienteExiste == true) {
          var usuarioTipo = 'paciente';
          var idUsuario = isLoged["id"];
          storage.write('isLogued', true);
          storage.write('usuarioTipo', usuarioTipo);
          storage.write('idUsuario', idUsuario);
          cargando(false);
          return {"login": true, "tipo": usuarioTipo};
        }

        if (medicoExiste == true) {
          var usuarioTipo = 'medico';
          var idUsuario = isLoged["id"];
          storage.write('isLogued', true);
          storage.write('usuarioTipo', usuarioTipo);
          storage.write('idUsuario', idUsuario);
          cargando(false);
          return {"login": true, "tipo": usuarioTipo};
        }
        cargando(false);
        return {"login": false, "tipo": "No se pudo iniciar sesión"};
      }

      cargando(false);
      Map<String, dynamic> res = {
        "login": false,
        "tipo": "No se pudo iniciar sesión."
      };
      return res;
    } catch (e) {
      Map<String, dynamic> res = {"login": false, "tipo": "hubo un error"};
      cargando(false);
      return res;
    }
  }

  limpiarCampos() {
    correo.text = '';
    password.text = '';
    update();
  }

  cargando(bool value) {
    isLoading = value;
    update();
  }
}
