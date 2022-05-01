import 'package:flutter/material.dart';
// import 'package:glucoadmin/ui/themes/app_theme.dart';

Future displayDialogLogOut(BuildContext context) async {
  var respuesta = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15)),
        elevation: 5,
        title: const Text('Cerrar Sesion'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('¿Desea cerrar sesión?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
  return respuesta;
}
