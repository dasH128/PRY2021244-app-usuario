import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/perfil_paciente/perfil_paciente_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class PerfilPacienteScreen extends StatelessWidget {
  const PerfilPacienteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PerfilPacienteController());

    return GetBuilder<PerfilPacienteController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _viewHeader(),
                    const SizedBox(height: 20),
                    _viewContent(controller)
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget _viewHeader() {
    return Column(
      children: const [
        SizedBox(
          width: 90,
          height: 90,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: AppTheme.primary, size: 80.0),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Perfil del paciente',
          style: AppTheme.textEtiquetaTituloStlyle,
        )
      ],
    );
  }

  Widget _viewContent(PerfilPacienteController controller) {
    return FutureBuilder(
      future: controller.buscarPaciente(),
      builder: (BuildContext context, AsyncSnapshot<PacienteModel> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingPage();
        }

        PacienteModel? paciente = snapshot.data;

        return Card(
          child: Column(
            children: [
              ListTile(
                title: const Text('Nombre'),
                subtitle: Text(paciente!.nombre),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Apellidos'),
                subtitle: Text(paciente.apellidos),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Número de telefono'),
                subtitle: Text(paciente.numero),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Dirección'),
                subtitle: Text(paciente.direccion),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Médico'),
                subtitle: Text(paciente.medicoId),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
            ],
          ),
        );
      },
    );
  }
}
