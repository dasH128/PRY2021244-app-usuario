import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';

class HomePacienteController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();
  final StreamController<String> streamController = StreamController<String>();
  // var storage = GetStorage();
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  Stream<String> get glucosaStream => streamController.stream;
// String get glucosa => _streamController;
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
  HomePacienteController() {
    // Stream<String> data = obtenerGlucosaActual();
    // data.listen((event) {
    //   print(event);
    //   showDialog(context: context, builder: builder)
    // });
    obtenerGlucosaActual();
    // pacienteProvider.obtenerGlucosaActual('mRgz7wqxUnd8nN3hruiGNqkP0SO2');
  }

  logout() {
    var storage = GetStorage();
    storage.remove('isLogued');
    storage.remove('usuarioTipo');
    storage.remove('idUsuario');
  }

  obtenerGlucosaActual() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    print('pipipipipi obtenerGlucosaActual');

    Stream<DocumentSnapshot<Map<String, dynamic>>>
        pacientesCollectionReference = FirebaseFirestore.instance
            .collection('pacientes')
            .doc(idUsuario)
            .snapshots();

    pacientesCollectionReference
        .listen((DocumentSnapshot<Map<String, dynamic>> event) {
      Map<String, dynamic> data = event.data() as Map<String, dynamic>;
      print('xxxxxxxxx ${data["glucosa"]}');
      streamController.sink.add(data["glucosa"]);
    });

    // var c = pacienteProvider.obtenerGlucosaActual(idUsuario);
    // c.listen((event) {
    //   _streamController.sink.add(event);
    // });
    // yield pacienteProvider.obtenerGlucosaActual(idUsuario);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    streamController.close();
    super.dispose();
  }
}
