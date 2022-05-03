import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuRegistroFisicoController extends GetxController {
  var listaOpcionesMenu = [
    {
      'nombre': 'Saludable',
      'imagen': Icons.cake,
      'tipo': '1',
    },
    {
      'nombre': 'Regular',
      'imagen': Icons.restaurant,
      'tipo': '2',
    },
    {
      'nombre': 'No Recomendable',
      'imagen': Icons.no_food,
      'tipo': '3',
    },
    {
      'nombre': 'Antojo de dulce',
      'imagen': Icons.cookie,
      'tipo': '4',
    },
  ];
}
