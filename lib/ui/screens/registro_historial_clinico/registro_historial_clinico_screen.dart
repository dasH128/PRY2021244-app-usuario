import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_historial_clinico/registro_historial_clinico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class RegistroHistorialClinicoScreen extends StatelessWidget {
  const RegistroHistorialClinicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroHistorialClinicoController());
    return GetBuilder<RegistroHistorialClinicoController>(
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Historial Médico'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //   controller: controller.nombres,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'FEcha de Consulta'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //   controller: controller.nombres,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Motivo'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //   controller: controller.nombres,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Examen'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //   controller: controller.nombres,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Descripción'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    //   controller: controller.nombres,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Receta'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Guardar', style: AppTheme.textBtnStlyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
