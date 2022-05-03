import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/perfil_medico/perfil_medico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class PerfilMedicoScreen extends StatelessWidget {
  const PerfilMedicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PerfilMedicoController());

    return GetBuilder<PerfilMedicoController>(builder: (controller) {
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
          'Perfil del doctor',
          style: AppTheme.textEtiquetaTituloStlyle,
        )
      ],
    );
  }

  Widget _viewContent(PerfilMedicoController controller) {
    return FutureBuilder(
      future: controller.buscarPaciente(),
      builder: (BuildContext context, AsyncSnapshot<MedicoModel> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingPage();
        }

        MedicoModel? medico = snapshot.data;

        return Card(
          child: Column(
            children: [
              ListTile(
                title: const Text('Nombre'),
                subtitle: Text(medico!.nombre),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Apellidos'),
                subtitle: Text(medico.apellidos),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Número de telefono'),
                subtitle: Text(medico.numero),
                trailing: const Icon(
                  Icons.edit,
                  color: AppTheme.primary,
                ),
                onTap: () async {},
              ),
              ListTile(
                title: const Text('Número de colegiatura'),
                subtitle: Text(medico.numeroCpi),
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
