import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/home_paciente/home_paciente_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class HomePacienteScreen extends StatelessWidget {
  const HomePacienteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePacienteController());
    return GetBuilder<HomePacienteController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: _myDrawer(),
        body: SafeArea(
          child: Container(
            // color: Colors.red,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _vistaHeader(context, controller),
                  _opcionesMenu(controller),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _vistaHeader(BuildContext context, HomePacienteController controller) {
    return Container(
      // color: Colors.amber,
      height: 110,
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Registro',
                    textAlign: TextAlign.center, style: AppTheme.textBtnStlyle),
                Container(
                    //   color: Colors.green,
                    child: ElevatedButton(
                  onPressed: () {
                    //   paciente_resumen
                    Navigator.pushNamed(context, 'paciente_resumen');
                  },
                  child: const Text(
                    'Detalles',
                    style: AppTheme.textBtnStlyle,
                  ),
                ))
              ],
            ),
            const Text(
              '120 mg/dl',
              style: AppTheme.textBtnStlyle,
            )
          ],
        ),
      ),
    );
  }

  Widget _opcionesMenu(HomePacienteController controller) {
    return Expanded(
      child: GridView.builder(
          itemCount: controller.listaOpcionesMenu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              height: 200,
              //   color: Colors.amber,
              child: _cardMenu(context, controller.listaOpcionesMenu[index]),
            );
          }),
    );
  }

  Widget _myDrawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
            ),
            child: Row(
              children: const [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, color: AppTheme.primary, size: 80.0),
                  ),
                ),
                Text(
                  '   Hola --------',
                  style: AppTheme.textStlyle,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppTheme.primary,
            ),
            title: const Text('Inicio', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              color: AppTheme.primary,
            ),
            title: const Text('Calendario', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.assignment,
              color: AppTheme.primary,
            ),
            title: const Text('Reporte', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.messenger,
              color: AppTheme.primary,
            ),
            title: const Text('Comunicarme', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: AppTheme.primary,
            ),
            title: const Text('Notificaciones', style: AppTheme.textStlyle),
            trailing: const Icon(
              Icons.error,
              color: AppTheme.primary,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppTheme.primary,
            ),
            title: const Text('Salir', style: AppTheme.textStlyle),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  Widget _cardMenu(BuildContext context, var opcion) {
    return Container(
      //   color: Colors.amber,
      child: InkWell(
        onTap: () async {
          Navigator.pushNamed(context, opcion['router']);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 15,
          shadowColor: AppTheme.primary.withOpacity(0.4),
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
      ),
    );
  }
}
