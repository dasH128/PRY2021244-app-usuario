import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/menu_pacientes/menu_pacientes_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_confirm.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class MenuPacientesScreen extends StatelessWidget {
  const MenuPacientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuPacientesController());

    return GetBuilder<MenuPacientesController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pacientes'),
        ),
        body: FutureBuilder(
          future: controller.listarPacientesdelMedico(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PacienteModel>> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingPage();
            }

            List<PacienteModel>? pacientes = snapshot.data;

            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    // shrinkWrap: false,
                    itemCount: pacientes!.length,
                    itemBuilder: (context, index) {
                      return _cardPacientes(
                          context, controller, pacientes[index]);
                    }),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _cardPacientes(BuildContext context,
      MenuPacientesController controller, PacienteModel paciente) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 15,
      shadowColor: AppTheme.primary.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.red,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${paciente.nombre} ${paciente.apellidos}'),
                const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, color: AppTheme.primary, size: 80.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Column(
              children: [
                Switch(
                  value: paciente.estado,
                  onChanged: (value) async {
                    var respuestaDialog = await displayDialogConfirm(context,
                        '¿Se encuentra seguro de inhabilitar al paciente?');
                    // controller.cambiarEstadoMedico(medico);
                    // medico.setEstado(value);
                    if (respuestaDialog == true) {
                      bool isUpdated =
                          await controller.cambiarEstadoPaciente(paciente);

                      if (isUpdated == true) {
                        controller.update();
                      }
                    }
                  },
                ),
                // Text('Pacientes'),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, 'chat');
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.message),
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () async {
                        // Navigator.pushNamed(context, 'chats');
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.task),
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, 'historial_clinico');
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.assignment),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
