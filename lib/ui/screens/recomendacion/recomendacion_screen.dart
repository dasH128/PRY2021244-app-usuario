import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/recomendacion/recomendacion_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class RecomendacionScreen extends StatelessWidget {
  const RecomendacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RecomendacionController());
    return GetBuilder<RecomendacionController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recomendación'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          //   color: Colors.red,
          width: double.infinity,
          height: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 15,
            shadowColor: AppTheme.primary.withOpacity(0.4),
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text('Beber abundante agua'),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.recomendacion1,
                  onChanged: (value) {
                    controller.setRespuesta(value!, 1);
                  },
                ),
                CheckboxListTile(
                  title: const Text('Ajustar la dosis de insulina'),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.recomendacion2,
                  onChanged: (value) {
                    controller.setRespuesta(value!, 2);
                  },
                ),
                CheckboxListTile(
                  title: const Text('Hacer más actividades físicas'),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.recomendacion3,
                  onChanged: (value) {
                    controller.setRespuesta(value!, 3);
                  },
                ),
                CheckboxListTile(
                  title: const Text('Ingerir más carbohidratos'),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.recomendacion4,
                  onChanged: (value) {
                    controller.setRespuesta(value!, 4);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
