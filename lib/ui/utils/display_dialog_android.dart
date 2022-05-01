import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

Future displayDialogAndroid(
    BuildContext context, String titulo, String mensaje, IconData icon) async {
  var respuesta = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15)),
          elevation: 5,
          title: Icon(
            icon,
            size: 40,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mensaje,
                style: AppTheme.textEtiquetaStlyle,
              ),
              const SizedBox(height: 15),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
              width: double.infinity,
              height: AppTheme.heightInputs,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Aceptar',
                  style: AppTheme.textBtnStlyle,
                ),
              ),
            )
          ],
        );
      });

  return respuesta;
}
