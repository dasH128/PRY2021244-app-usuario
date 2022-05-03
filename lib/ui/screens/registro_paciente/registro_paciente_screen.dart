import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/medico_model.dart';
import 'package:glucoapp/ui/screens/registro_paciente/registro_paciente_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_android.dart';
import 'package:glucoapp/ui/widgets/widgets.dart';

class RegistroPacienteScreen extends StatelessWidget {
  const RegistroPacienteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistroPacienteController());
    var size = MediaQuery.of(context).size;

    return GetBuilder<RegistroPacienteController>(builder: (controller) {
      print('----------GetBuilder----------');
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
                          controller: controller.nombre,
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
                            // height: AppTheme.heightInputs,
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
                            // height: AppTheme.heightInputs,
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
                            // height: AppTheme.heightInputs,
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
                            // height: AppTheme.heightInputs,
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
                            // height: AppTheme.heightInputs,
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
                            // height: AppTheme.heightInputs,
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
                      dropdownButtonMedicos(controller),
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

  Widget dropdownButtonMedicos(RegistroPacienteController controller) {
    print('----------dropdownButtonMedicos----------');
    return FutureBuilder(
        future: controller.listaMedicosDisponibles(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MedicoModel>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: AppTheme.heightInputs,
              child: TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Medico'),
              ),
            );
          }

          List<MedicoModel>? lista = snapshot.data;

          return Container(
            // height: AppTheme.heightInputs,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: DropdownButton<MedicoModel>(
              icon: const Icon(Icons.arrow_downward),
              isExpanded: true,
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                // color: Colors.deepPurpleAccent,
              ),
              items: lista?.map(
                (MedicoModel medico) {
                  return DropdownMenuItem<MedicoModel>(
                      value: medico,
                      child: Container(
                        child: Text(medico.nombre),
                      ));
                },
              ).toList(),
              value: controller.medicoSeleccionado,
              onChanged: (value) {
                controller.actualizarSeleccion(value!);
              },
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
          bool validacion = controller.validarCampos();
          if (validacion == false) {
            return;
          }

          bool respuesta = await controller.registrarPaciente();
          // Navigator.pushReplacementNamed(
          //     context, 'home_paciente');
          //   bool validacion = controller.validarCampos();
          //   if (validacion == false) {
          //     return;
          //   }
          if (respuesta == true) {
            var s = await displayDialogAndroid(
                context,
                '',
                'Se registró exitosamente su cuenta de paciente',
                Icons.check_circle_outline);
            print(s);
            print('VAMOS A LOGIN');
            Navigator.pushReplacementNamed(context, 'login');
          } else {
            await displayDialogAndroid(
                context,
                '',
                'No se registró exitosamente su cuenta de paciente, intentelo otra vez',
                Icons.highlight_off_outlined);
          }
        },
        child: const Text('Continuar', style: AppTheme.textBtnStlyle),
      );
    }
  }
}
