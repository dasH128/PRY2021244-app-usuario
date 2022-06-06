import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/medico_historial/medico_historial_controller.dart';

class MedicoHistorialScreen extends StatelessWidget {
  const MedicoHistorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoHistorialController());

    return GetBuilder<MedicoHistorialController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text('MedicoHistorialScreen'),
        ),
      );
    });
  }
}
