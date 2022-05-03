import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/menu_registro_alimentacion/menu_registro_alimentacion_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class MenuRegistroAlimentacionScreen extends StatelessWidget {
  const MenuRegistroAlimentacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuRegistroAlimentacionController());
    return GetBuilder<MenuRegistroAlimentacionController>(
        builder: (controller) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Registro Alimentación'),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              child: _opcionesMenu(controller),
            ),
          ));
    });
  }

  Widget _opcionesMenu(MenuRegistroAlimentacionController controller) {
    return GridView.builder(
        itemCount: controller.listaOpcionesMenu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 200,
            height: 200,
            //   color: Colors.amber,
            child: _cardMenu(context, controller.listaOpcionesMenu[index]),
          );
        });
  }

  Widget _cardMenu(BuildContext context, var opcion) {
    return InkWell(
      onTap: () async {
        Navigator.pushNamed(context, 'registro_alimentacion');
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Icon(
                opcion['imagen'],
                size: 70,
                color: AppTheme.primary,
              ),
            ),
            Text(
              opcion["nombre"],
              style: AppTheme.textStlyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
