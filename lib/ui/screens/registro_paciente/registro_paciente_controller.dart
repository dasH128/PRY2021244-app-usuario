import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/data/providers/medico_provider.dart';
import 'package:glucoapp/data/providers/paciente_provider.dart';
import 'package:glucoapp/domain/models.dart';

class RegistroPacienteController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();
  final medicoProvider = Get.find<MedicoProvider>();
  bool isLoading = false;

  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController numeroOpcional = TextEditingController();
  late MedicoModel medicoSeleccionado;
  TextEditingController descripcion = TextEditingController();
  RegistroPacienteController();

  Future<bool> registrarPaciente() async {
    try {
      cargando(true);
      String isCreatedId =
          await pacienteProvider.crearCuentaPaciente(correo.text, dni.text);

      if (isCreatedId.isEmpty) {
        cargando(false);
        return false;
      }
      var newPaciente = PacienteModel(
        id: isCreatedId,
        nombre: nombre.text,
        apellidos: apellidos.text,
        numero: numero.text,
        dni: dni.text,
        direccion: direccion.text,
        medicoId: medicoSeleccionado.id,
        medicoEstado: 'PENDIENTE',
        correo: correo.text,
      );
      bool isOk = await pacienteProvider.registrarPaciente(newPaciente);

      cargando(false);
      return isOk;
    } catch (e) {
      print('----------e-------');
      print(e);
      cargando(false);
      return false;
    }
  }

  Future<List<MedicoModel>> listaMedicosDisponibles() async {
    try {
      List<MedicoModel> respuesta = await medicoProvider.listarMedicos();
      medicoSeleccionado = respuesta[0];
      return respuesta;
    } catch (e) {
      return [];
    }
    // print('sss  $s  sss');
  }

  actualizarSeleccion(MedicoModel medico) {
    medicoSeleccionado = medico;
    print('medicoSeleccionado ${medico.apellidos}');
    // update();
  }

  bool validarCampos() {
    print('nombre ${nombre.value.text}');
    print('apellidos ${apellidos.value.text}');
    print('numero ${numero.value.text}');
    print('correo ${correo.value.text}');
    print('dni ${dni.value.text}');
    if (nombre.value.text.isEmpty ||
        apellidos.value.text.isEmpty ||
        numero.value.text.isEmpty ||
        correo.value.text.isEmpty ||
        dni.value.text.isEmpty) {
      Get.snackbar('Registro', 'Porfavor revisar y completar todos los campos');
      return false;
    }

    if ((nombre.value.text.length < 3) ||
        (apellidos.value.text.length < 3) ||
        (numero.value.text.length != 9) ||
        (dni.value.text.length != 8)) {
      Get.snackbar('Registro', 'Porfavor completar correctamente');
      return false;
    }

    return true;
  }

  limpiarCampos() {
    nombre.text = '';
    apellidos.text = '';
    numero.text = '';
    dni.text = '';
    correo.text = '';
  }

  cargando(bool value) {
    isLoading = value;
    update();
  }
}
