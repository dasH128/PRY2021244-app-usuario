import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glucoapp/domain/models.dart';

class PacienteProvider extends GetConnect {
  final CollectionReference pacientesCollectionReference =
      FirebaseFirestore.instance.collection('pacientes');

  Future<String> crearCuentaPaciente(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var id = credential.user!.uid;
      print('el id es $id');
      print(credential.user);
      return id;
    } catch (e) {
      print('----------crearCuentaPaciente-------');
      print(e);
      return '';
    }
  }

  Future<bool> registrarPaciente(PacienteModel paciente) async {
    try {
      var pacienteMap = paciente.toMap();
      await pacientesCollectionReference.doc(paciente.id).set(pacienteMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editarPaciente() async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> pacienteExiste(String id) async {
    try {
      QuerySnapshot paciente =
          await pacientesCollectionReference.where('id', isEqualTo: id).get();
      if (paciente.docs.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<PacienteModel> buscarPacientePorId(String id) async {
    try {
      DocumentSnapshot<Object?> paciente =
          await pacientesCollectionReference.doc(id).get();

      var pacienteDB = paciente.data() as Map<String, dynamic>;
      PacienteModel pacienteModel = PacienteModel.fromMap(pacienteDB);

      return pacienteModel;
    } catch (e) {
      return PacienteModel(
          id: '0',
          nombre: 'nombre',
          apellidos: 'apellidos',
          numero: 'numero',
          dni: 'dni',
          direccion: 'direccion',
          medicoId: 'medicoId',
          medicoEstado: 'medicoEstado',
          correo: 'correo');
    }
  }

  
}
