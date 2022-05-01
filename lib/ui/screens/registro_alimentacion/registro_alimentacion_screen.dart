import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_alimentacion/registro_alimentacion_controller.dart';

class RegistroAlimentacionScreen extends StatelessWidget {
  const RegistroAlimentacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroAlimentacionController());
    return GetBuilder<RegistroAlimentacionController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text('RegistroAlimentacionScreen'),
        ),
      );
    });
  }
}
