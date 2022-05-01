import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/data/providers/medico_provider.dart';
import 'package:glucoapp/data/providers/paciente_provider.dart';
import 'package:glucoapp/domain/models.dart';

class RegistroPacienteController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();
  final medicoProvider = Get.find<MedicoProvider>();
  bool isLoading = false;

  TextEditingController nombres = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController numeroOpcional = TextEditingController();

  TextEditingController descripcion = TextEditingController();
  RegistroPacienteController();

  Future<bool> registrarPaciente() async {
    try {
      //   cargando(true);
      String isCreatedId =
          await pacienteProvider.crearCuentaPaciente(correo.text, dni.text);

      if (isCreatedId.isEmpty) {
        // cargando(false);
        return false;
      }
      var newPaciente = PacienteModel(
        id: isCreatedId,
        nombres: nombres.text,
        apellidos: apellidos.text,
        numero: numero.text,
        dni: dni.text,
        direccion: direccion.text,
        medico: '',
        medicoEstado: 'PENDIENTE',
        correo: correo.text,
      );
      bool isOk = await pacienteProvider.registrarPaciente(newPaciente);

      //   cargando(false);
      return isOk;
    } catch (e) {
      cargando(false);
      return false;
    }
  }

  bool validarCampos() {
    if (nombres.value.text.isEmpty ||
        apellidos.value.text.isEmpty ||
        numero.value.text.isEmpty ||
        correo.value.text.isEmpty ||
        dni.value.text.isEmpty) {
      Get.snackbar('Registro', 'Porfavor revisar y completar todos los campos');
      return false;
    }

    if ((nombres.value.text.length < 3) ||
        (apellidos.value.text.length < 3) ||
        (numero.value.text.length != 9) ||
        (dni.value.text.length != 8)) {
      Get.snackbar('Registro', 'Porfavor completar correctamente');
      return false;
    }

    return true;
  }

  Future listaMedicosDisponibles() async {
    var s = await medicoProvider.listarMedicos();
    print('sss  $s  sss');
  }

  cargando(bool value) {
    isLoading = value;
    update();
  }
}
