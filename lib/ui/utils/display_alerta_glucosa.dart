import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

Future displayAlertaGlucosa(
    BuildContext context, String glucosa, String tipo, Color color) async {
  var respuesta = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: color),
                borderRadius: BorderRadiusDirectional.circular(15)),
            elevation: 5,
            content: Container(
              //   color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                          //   color: Colors.green,
                          width: 180,
                          child: Text(
                            '!Alerta! Usted está sufriendo una $tipo',
                            textAlign: TextAlign.center,
                          )),
                      Icon(
                        Icons.bloodtype_outlined,
                        size: 40,
                        color: color,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          glucosa,
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: const Text('mg/dl'),
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                width: double.infinity,
                height: AppTheme.heightInputs,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: color,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Aceptar',
                    style: AppTheme.textBtnStlyle,
                  ),
                ),
              )
            ]);
      });
}
