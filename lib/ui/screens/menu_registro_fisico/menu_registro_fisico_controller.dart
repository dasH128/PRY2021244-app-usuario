import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuRegistroFisicoController extends GetxController {
  var listaOpcionesMenu = [
    {
      'nombre': 'Caminar',
      'imagen': Icons.directions_walk,
      'tipo': '1',
    },
    {
      'nombre': 'Bicicleta',
      'imagen': Icons.pedal_bike_sharp,
      'tipo': '2',
    },
    {
      'nombre': 'Correr',
      'imagen': Icons.directions_run_rounded,
      'tipo': '3',
    },
    {
      'nombre': 'Agregar',
      'imagen': Icons.add,
      'tipo': '4',
    },
  ];
}
