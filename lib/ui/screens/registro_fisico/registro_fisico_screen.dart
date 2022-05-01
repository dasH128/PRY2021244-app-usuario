import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_fisico/registro_fisico_controller.dart';

class RegistroFisicoScreen extends StatelessWidget {
  const RegistroFisicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroFisicoController());
    return GetBuilder<RegistroFisicoController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Text('RegistroFisicoScreen'),
        ),
      );
    });
  }
}
