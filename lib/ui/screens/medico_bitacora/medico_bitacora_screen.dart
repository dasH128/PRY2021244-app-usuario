import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/medico_bitacora/medico_bitacora_controller.dart';

class MedicoBitacoraScreen extends StatelessWidget {
  const MedicoBitacoraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MedicoBitacoraController());

    return GetBuilder<MedicoBitacoraController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text('MedicoBitacoraScreen'),
        ),
      );
    });
  }
}
