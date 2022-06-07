import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_alimentacion/registro_alimentacion_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_android.dart';

class RegistroAlimentacionScreen extends StatelessWidget {
  const RegistroAlimentacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroAlimentacionController());
    var nombreActividad = ModalRoute.of(context)?.settings.arguments as String;
    // var nombreActividad = arg[0] as String;
    print('actividad: $nombreActividad');

    return GetBuilder<RegistroAlimentacionController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Alimentacion'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    _mostrarDatapicker(context, controller);
                  },
                  child: SizedBox(
                    height: AppTheme.heightInputs,
                    child: TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.hora,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'hora'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.comida,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Comida Ingerida'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool respuesta =
                          await controller.registrar(nombreActividad);
                      if (respuesta == true) {
                        await displayDialogAndroid(
                            context,
                            '',
                            'Se registró exitosamente',
                            Icons.check_circle_outline);
                      } else {
                        await displayDialogAndroid(
                            context,
                            '',
                            'No se registró, intentelo otra vez',
                            Icons.highlight_off_outlined);
                      }
                    },
                    child:
                        const Text('Continuar', style: AppTheme.textBtnStlyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _mostrarDatapicker(
      BuildContext context, RegistroAlimentacionController controller) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      print('actualizar hora');
      controller.actualizarHora(time);
    }
  }
}
