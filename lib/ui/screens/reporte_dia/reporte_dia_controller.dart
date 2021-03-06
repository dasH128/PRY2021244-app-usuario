import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class ReporteDiaController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();

  TextEditingController comentario = TextEditingController();
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

  Future<bool> registrarComentario() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var respuesta =
        await pacienteProvider.registrarBitacora(idUsuario, comentario.text);

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
    comentario.text = '';
    update();
  }

  Future<List<PuntoModel>> obtenerGlucosaPorDia(DateTime dateTime) async {
    //   int dia = dia.d, int mes, int year
    int dia = dateTime.day;
    int mes = dateTime.month;
    int year = dateTime.year;
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    print('--- $dia $mes $year $idUsuario ---');
    List<PuntoModel> data =
        await pacienteProvider.obtenerGlucosaPorDia(dia, mes, year);
    return data;
  }
}
