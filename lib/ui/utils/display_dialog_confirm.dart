import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
// import 'package:glucoadmin/ui/themes/app_theme.dart';

Future displayDialogConfirm(BuildContext context, String mensaje) async {
  var s = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15)),
        elevation: 5,
        // title: const Text(''),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                mensaje,
                style: AppTheme.textEtiquetaStlyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              //   controller.logout();
              Navigator.pop(context, true);
              //   Navigator.pushReplacementNamed(context, 'login');
            },
            child: const Text('SI'),
          )
        ],
      );
    },
  );
  return s;
}
