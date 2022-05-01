import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/reporte_diario/reporte_diario_controller.dart';

class ReporteDiarioScreen extends StatelessWidget {
  const ReporteDiarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReporteDiarioController());

    return GetBuilder<ReporteDiarioController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text('ReporteDiarioScreen'),
        ),
      );
    });
  }
}
