import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glucoapp/data/providers/providers.dart';

class LoginController extends GetxController {
  final autentificacionProvider = Get.find<AutentificacionProvider>();

  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController();

  login() async {
    bool isLoged = await autentificacionProvider.login(correo.text, password.text);
  }
}
