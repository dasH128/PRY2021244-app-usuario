import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glucoapp/data/providers/medico_provider.dart';

class ReporteMedicoController extends GetxController {
  TextEditingController recomendacion = TextEditingController();
  final medicoProvider = Get.find<MedicoProvider>();

  String mesEnString(int mes) {
    String mesTexto = '';
    switch (mes) {
      case 1:
        mesTexto = 'Enero';
        break;
      case 2:
        mesTexto = 'Febrero';
        break;
      case 3:
        mesTexto = 'Marzo';
        break;
      case 4:
        mesTexto = 'Abril';
        break;
      case 5:
        mesTexto = 'Mayo';
        break;
      case 6:
        mesTexto = 'Junio';
        break;
      case 7:
        mesTexto = 'Julio';
        break;
      case 8:
        mesTexto = 'Agosto';
        break;
      case 9:
        mesTexto = 'Septiembre';
        break;
      case 10:
        mesTexto = 'Octubre';
        break;
      case 11:
        mesTexto = 'Noviembre';
        break;
      case 12:
        mesTexto = 'Diciembre';
        break;
      default:
        mesTexto = '_';
        break;
    }

    return mesTexto;
  }

  Future<bool> registrarRecomendacion(String idPaciente) async {
    var respuesta = await medicoProvider.registrarRecomendacionAlPaciente(
        idPaciente, recomendacion.text);

    if (respuesta == true) {
      Get.snackbar('Recomendación', 'Se guardo exitosamente.');
      limparCampos();
      return true;
    } else {
      Get.snackbar('Recomendación', 'Intentelo otra vez.');
      return false;
    }
  }

  limparCampos() {
    recomendacion.text = '';
    update();
  }
}
