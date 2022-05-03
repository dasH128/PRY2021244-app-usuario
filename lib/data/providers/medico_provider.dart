import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glucoapp/domain/models.dart';

class MedicoProvider extends GetConnect {
  final CollectionReference medicosCollectionReference =
      FirebaseFirestore.instance.collection('medicos');

  Future<List<MedicoModel>> listarMedicos() async {
    try {
      List<MedicoModel> respuesta = [];
      QuerySnapshot<Object?> respuestaFirestore =
          await medicosCollectionReference
              .where('estado', isEqualTo: true)
              .get();
      var listaMedicos = respuestaFirestore.docs;

      for (var medico in listaMedicos) {
        print('-----------------');
        var elemento = medico.data() as Map<String, dynamic>;
        respuesta.add(MedicoModel(
          id: elemento["id"],
          nombre: elemento["nombre"],
          apellidos: elemento["apellidos"],
          numero: elemento["numero"],
          dni: elemento["dni"],
          numeroCpi: elemento["numeroCpi"],
          especialidad: elemento["especialidad"],
          experiencia: elemento["experiencia"],
          correo: elemento["correo"],
        ));
        print(elemento);
        print('-----------------');
      }

      return respuesta;
    } catch (e) {
      return [];
    }
  }

  Future<List<PacienteModel>> listarPacientesdelMedico(String idMedico) async {
    try {
      List<PacienteModel> respuesta = [];
      QuerySnapshot<Object?> respuestaFirestore = await FirebaseFirestore
          .instance
          .collection('pacientes')
          .where('medicoId', isEqualTo: idMedico)
          .get();
      var listaPacientes = respuestaFirestore.docs;

      for (var paciente in listaPacientes) {
        var elemento = paciente.data() as Map<String, dynamic>;
        respuesta.add(PacienteModel(
          id: elemento["id"],
          nombre: elemento["nombre"],
          apellidos: elemento["apellidos"],
          numero: elemento["numero"],
          dni: elemento["dni"],
          direccion: elemento["direccion"],
          medicoId: elemento["medicoId"],
          medicoEstado: elemento["medicoEstado"],
          correo: elemento["correo"],
        ));
      }
      return respuesta;
    } catch (e) {
      return [];
    }
  }

  Future<bool> pacienteExiste(String id) async {
    try {
      QuerySnapshot medico =
          await medicosCollectionReference.where('id', isEqualTo: id).get();
      if (medico.docs.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<MedicoModel> buscarMedicoPorId(String id) async {
    try {
      DocumentSnapshot<Object?> medico =
          await medicosCollectionReference.doc(id).get();

      var medicoDB = medico.data() as Map<String, dynamic>;
      MedicoModel medicoModel = MedicoModel.fromMap(medicoDB);

      return medicoModel;
    } catch (e) {
      return MedicoModel(
          id: '0',
          nombre: 'nombre',
          apellidos: 'apellidos',
          numero: 'numero',
          dni: 'dni',
          numeroCpi: 'numeroCpi',
          especialidad: 'especialidad',
          experiencia: 'experiencia',
          correo: 'correo');
    }
  }

  Future<bool> cambiarEstadoPaciente(PacienteModel paciente) async {
    try {
      bool value = paciente.estado;
      print('pipip ${paciente.id} ${paciente.estado} ');
      //   await medicosCollectionReference
      //       .doc(paciente.id)
      //       .update({"estado": !value});
      return true;
    } catch (e) {
      print('cambiarEstadoMedico $e');
      return false;
    }
  }

}
