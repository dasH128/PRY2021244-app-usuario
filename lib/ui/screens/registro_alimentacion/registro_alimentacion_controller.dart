import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistroAlimentacionController extends GetxController {
  TextEditingController hora = TextEditingController();
  TextEditingController comida = TextEditingController();

  Future<bool> registrar() async {
    return true;
  }

  actualizarHora(TimeOfDay time) {
    print(time.toString());
    hora.text = '${time.hour} : ${time.minute}';
    update();
  }
}
