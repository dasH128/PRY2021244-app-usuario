import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReporteDiaController extends GetxController {
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
    return true;
  }
}
