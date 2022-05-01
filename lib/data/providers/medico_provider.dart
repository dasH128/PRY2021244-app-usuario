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
}
