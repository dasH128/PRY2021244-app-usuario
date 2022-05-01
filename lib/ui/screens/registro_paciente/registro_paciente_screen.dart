import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/registro_paciente/registro_paciente_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/widgets/widgets.dart';

class RegistroPacienteScreen extends StatelessWidget {
  const RegistroPacienteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroPacienteController());
    var size = MediaQuery.of(context).size;

    return GetBuilder<RegistroPacienteController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text('Crear Paciente')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppTheme.heightInputs,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.nombres,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Nombres Completos'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: AppTheme.heightInputs,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.apellidos,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Apellidos'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.dni,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Dni')),
                          ),
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.fecha,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Fecha')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.direccion,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Dirección')),
                          ),
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.numero,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Número')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.correo,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Correo')),
                          ),
                          SizedBox(
                            height: AppTheme.heightInputs,
                            width: size.width * 0.45,
                            child: TextFormField(
                                controller: controller.numeroOpcional,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                    hintText: 'Número opcional')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: AppTheme.heightInputs,
                        child: TextFormField(
                          //   controller: controller.,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Seleccione un médico'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: AppTheme.heightInputs,
                        child: TextFormField(
                          controller: controller.descripcion,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Descripción'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: AppTheme.heightInputs,
                        width: double.infinity,
                        child: _crearBotonRegistrar(context, controller),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _crearBotonRegistrar(
      BuildContext context, RegistroPacienteController controller) {
    if (controller.isLoading == true) {
      return const CustomLoadingButton();
    } else {
      return ElevatedButton(
        onPressed: () async {
          // Navigator.pushReplacementNamed(
          //     context, 'home_paciente');
          //   bool validacion = controller.validarCampos();
          //   if (validacion == false) {
          //     return;
          //   }

          //   bool respuesta = await controller.registrarPaciente();
          await controller.listaMedicosDisponibles();
        },
        child: const Text('Continuar', style: AppTheme.textBtnStlyle),
      );
    }
  }
}
