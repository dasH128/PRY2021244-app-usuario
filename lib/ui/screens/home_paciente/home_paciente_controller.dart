import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      'router': 'menu_reporte_diario',
    },
    {
      'nombre': 'Calendario',
      'imagen': Icons.calendar_month,
      'router': 'menu_calendario',
    },
  ];
  HomePacienteController();
}
