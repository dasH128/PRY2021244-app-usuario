import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/menu_registro_fisico/menu_registro_fisico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class MenuRegistroFisicoScreen extends StatelessWidget {
  const MenuRegistroFisicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuRegistroFisicoController());
    return GetBuilder<MenuRegistroFisicoController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Registro Físico'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            child: _opcionesMenu(controller),
          ),
        ),
      );
    });
  }

  Widget _opcionesMenu(MenuRegistroFisicoController controller) {
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
        Navigator.pushNamed(context, 'registro_fisico',
            arguments: opcion["nombre"]);
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
