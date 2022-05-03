import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/home_medico/home_medico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_logout.dart';

class HomeMedicoScreen extends StatelessWidget {
  const HomeMedicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeMedicoController());

    return GetBuilder<HomeMedicoController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(),
        drawer: _myDrawer(context, controller),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: false,
                itemCount: controller.listaOpcionesMenu.length,
                itemBuilder: (context, index) {
                  return _cardMenu(
                      context, controller.listaOpcionesMenu[index]);
                }),
          ),
        ),
      );
    });
  }

  Widget _myDrawer(BuildContext context, HomeMedicoController controller) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
            ),
            child: InkWell(
              onTap: () async {
                Navigator.pushNamed(context, 'perfil_medico');
              },
              child: Row(
                children: const [
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          color: AppTheme.primary, size: 80.0),
                    ),
                  ),
                  Text(
                    '   Hola ',
                    style: AppTheme.textStlyle,
                  ),
                ],
              ),
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
              Icons.list,
              color: AppTheme.primary,
            ),
            title: const Text('Pacientes', style: AppTheme.textStlyle),
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
            title: const Text('Chats', style: AppTheme.textStlyle),
            trailing: const Icon(
              Icons.error,
              color: AppTheme.primary,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.assignment_ind,
              color: AppTheme.primary,
            ),
            title: const Text('Historial clínico', style: AppTheme.textStlyle),
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
            onTap: () async {
              var respuesta = await displayDialogLogOut(context);
              if (respuesta == true) {
                //Cerrar Session
                controller.logout();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'login');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _cardMenu(BuildContext context, var opcion) {
    return InkWell(
      onTap: () async {
        Navigator.pushNamed(context, opcion['router']);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 70,
              height: 70,
              child: Icon(
                opcion['imagen'],
                size: 70,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              opcion["nombre"],
              style: AppTheme.textStlyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
