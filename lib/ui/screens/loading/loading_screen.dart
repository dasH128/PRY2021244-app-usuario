import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/ui/screens/loading/loading_controller.dart';
import 'package:glucoapp/ui/widgets/widgets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoadingController());

    _validarTipoUsuario(context);
    return GetBuilder<LoadingController>(
      builder: (controller) {
        return const Scaffold(
            body: SafeArea(
          child: CustomLoadingPage(),
        ));
      },
    );
  }

  void _validarTipoUsuario(BuildContext context) async {
    Timer(const Duration(seconds: 2), () async {
      var storage = GetStorage();
      var isExist = storage.read<bool>('isLogued');

      if (isExist == true) {
        var usuarioTipo = storage.read<String>('usuarioTipo');
        if (usuarioTipo == 'paciente') {
          Navigator.pushReplacementNamed(context, 'home_paciente');
        } else {
          Navigator.pushReplacementNamed(context, 'home_medico');
        }
      } else {
        Navigator.pushReplacementNamed(context, 'inicio');
      }
    });
  }
}
