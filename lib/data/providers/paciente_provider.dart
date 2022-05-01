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
      return '';
    }
  }

  Future<bool> registrarPaciente(PacienteModel paciente) async {
    try {
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
}
