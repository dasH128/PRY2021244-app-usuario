import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/paciente_provider.dart';

class RegistroAlimentacionController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();
  TextEditingController hora = TextEditingController();
  TextEditingController comida = TextEditingController();

  Future<bool> registrar(String actividad) async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var res =
        await pacienteProvider.registarActividadAlimento(idUsuario, actividad);
    return res;
  }

  actualizarHora(TimeOfDay time) {
    print(time.toString());
    hora.text = '${time.hour} : ${time.minute}';
    update();
  }
}
