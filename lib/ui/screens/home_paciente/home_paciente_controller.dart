import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePacienteController extends GetxController {
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  var listaOpcionesMenu = [
    {
      'nombre': 'Registrar actividad física',
      'imagen': Icons.directions_run_rounded,
      'router': 'menu_registro_fisico',
    },
    {
      'nombre': 'Registrar alimentación',
      'imagen': Icons.apple,
      'router': 'menu_registro_alimentacion',
    },
    {
      'nombre': 'Reportes',
      'imagen': Icons.assignment,
      'router': 'menu_reporte_dia',
    },
    {
      'nombre': 'Calendario',
      'imagen': Icons.calendar_month,
      'router': 'menu_calendario',
    },
  ];
  HomePacienteController();

  logout() {
    var storage = GetStorage();
    storage.remove('isLogued');
    storage.remove('usuarioTipo');
    storage.remove('idUsuario');
  }
}
