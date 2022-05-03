import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_fisico/registro_fisico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_android.dart';

class RegistroFisicoScreen extends StatelessWidget {
  const RegistroFisicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(RegistroFisicoController());

    return GetBuilder<RegistroFisicoController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          controller.limpiar();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Registrar Tiempo'),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 15,
              shadowColor: AppTheme.primary.withOpacity(0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      controller.tiempoTexto(),
                      style: AppTheme.textEtiquetaTituloStlyle,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          // margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.width * 0.45,
                          child: ElevatedButton(
                            onPressed: () async {
                              controller.restablecer();
                            },
                            child: const Text('Restablecer',
                                style: AppTheme.textBtnStlyle),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: size.width * 0.45,
                          child: ElevatedButton(
                            onPressed: () async {
                              controller.stop();
                            },
                            child: const Text('Parar',
                                style: AppTheme.textBtnStlyle),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          // margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.width * 0.45,
                          child: ElevatedButton(
                            onPressed: () async {
                              controller.start();
                            },
                            child: const Text('Iniciar',
                                style: AppTheme.textBtnStlyle),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: size.width * 0.45,
                          child: ElevatedButton(
                            onPressed: () async {
                              bool respuesta = await controller.registrar();

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
                            child: const Text('Registrar',
                                style: AppTheme.textBtnStlyle),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future<bool> _onWillPopScope(RegistroFisicoController controller) async {
    print('raaaaaaa');
    controller.limpiar();
    return true;
  }
}
