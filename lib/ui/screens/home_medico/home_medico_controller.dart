import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeMedicoController extends GetxController {
  var listaOpcionesMenu = [
    {
      'nombre': 'Pacientes',
      'imagen': Icons.list_alt,
      'router': 'menu_pacientes',
    },
    {
      'nombre': 'Reportes',
      'imagen': Icons.insert_drive_file_rounded,
      'router': 'menu_reportes',
    },
    {
      'nombre': 'Comunicarme con Pacientes',
      'imagen': Icons.message,
      'router': 'menu_medico_chat',
    },
    {
      'nombre': 'Historia Clínicas',
      'imagen': Icons.pageview_rounded,
      'router': 'menu_historial_clinico',
    },
  ];

  logout() {
    var storage = GetStorage();
    storage.remove('isLogued');
    storage.remove('usuarioTipo');
    storage.remove('idUsuario');
  }
}
