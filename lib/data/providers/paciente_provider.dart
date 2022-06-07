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

  Future<List<RecomendacionModel>> listarRecomendaciones(
      String idPaciente) async {
    try {
      List<RecomendacionModel> respuesta = [];
      QuerySnapshot<Object?> respuestaFirestore =
          await pacientesCollectionReference
              .doc(idPaciente)
              .collection('recomendaciones')
              .get();

      var listaRecomendaciones = respuestaFirestore.docs;
      for (var elemento in listaRecomendaciones) {
        int time = elemento["time"] as int;

        respuesta.add(RecomendacionModel(
          estado: elemento["estado"],
          time: time,
          recomendacion: elemento["recomendacion"] + '',
        ));
      }
      return respuesta;
    } catch (e) {
      return [];
    }
  }

  Future<bool> actualizarEstadoRecomendacion(
      String idPaciente, RecomendacionModel recomendacion) async {
    try {
      bool value = recomendacion.estado;
      //   QuerySnapshot<Object?> respuestaFirestore =
      await pacientesCollectionReference
          .doc(idPaciente)
          .collection('recomendaciones')
          .doc('${recomendacion.time}')
          .update({"estado": !value});

      //   print('rrrrrrrrrrrrrr ${recomendacion.time} ${respuestaFirestore.docs}');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> registrarBitacora(String idPaciente, String comentario) async {
    try {
      Map<String, dynamic> data = {
        "comentario": comentario,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      await pacientesCollectionReference
          .doc(idPaciente)
          .collection('bitacoras')
          .doc('${data["time"]}')
          .set(data);
      //   print('idPaciente $idPaciente');
      return true;
    } catch (e) {
      print('eeeeeee $e');
      return false;
    }
  }

  Future<List<PuntoModel>> obtenerGlucosaPorDia(dia, mes, year) async {
    try {
      QuerySnapshot<Map<String, dynamic>> respuestaFirestore =
          await pacientesCollectionReference
              .doc("mRgz7wqxUnd8nN3hruiGNqkP0SO2")
              .collection("glucosa")
              .where('dia', isEqualTo: dia)
              .where('mes', isEqualTo: mes)
              .where('year', isEqualTo: year)
              //   .orderBy('time', descending: true)
              .get();

      var listaGlucosaPorDia = await respuestaFirestore.docs;
      List<PuntoModel> list = [];
      for (var glucosaPorDia in listaGlucosaPorDia) {
        String hora = glucosaPorDia["hora"];
        int h = int.parse(hora.substring(0, 2));
        int m = int.parse(hora.substring(3, 5));
        int ejeX = (h * 60) + m;
        int ejeY = glucosaPorDia["glucosa"];
        print(' $h * 60 + $m = $ejeX  -  $ejeY');
        list.add(PuntoModel(ejeX, ejeY));
        // print('hora $hora ${glucosaPorDia["glucosa"]}');
      }

      //   print('ssssssssssssssssssssss ${list.toString()}');
      list.sort((a, b) => a.ejeX.compareTo(b.ejeX));
      //   print('ssssssssssssssssssssss ${list[0].ejeX}');
      //   print('ssssssssssssssssssssss ${list[1].ejeX}');
      //   print('ssssssssssssssssssssss ${list[2].ejeX}');

      return list;
    } catch (e) {
      print('eeeeeeeeee $e');
      return [];
    }
  }

  Future<bool> registarActividadFisica(
      String idUsuario, String tiempo, String actividad) async {
    try {
      DateTime date = DateTime.now();
      Map<String, dynamic> data = {
        "id": date.millisecondsSinceEpoch,
        "year": date.year,
        "month": date.month,
        "day": date.day,
        "hour": '${date.hour} : ${date.minute}',
        "valor": tiempo,
        "actividad": actividad
      };
      await pacientesCollectionReference
          .doc(idUsuario)
          .collection('actividad_fisica')
          .doc('${data["id"]}')
          .set(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> registarActividadAlimento(
      String idUsuario, String actividad) async {
    try {
      DateTime date = DateTime.now();
      Map<String, dynamic> data = {
        "id": date.millisecondsSinceEpoch,
        "year": date.year,
        "month": date.month,
        "day": date.day,
        "hour": '${date.hour}:${date.minute}',
        "valor": 'tiempo',
        "actividad": actividad
      };
      await pacientesCollectionReference
          .doc(idUsuario)
          .collection('actividad_alimento')
          .doc('${data["id"]}')
          .set(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ActividadFisicaModel>> listarActividadFisica(
      String idPaciente, DateTime date) async {
    try {
      List<ActividadFisicaModel> respuesta = [];
      QuerySnapshot<Object?> respuestaFirestore =
          await pacientesCollectionReference
              .doc(idPaciente)
              .collection('actividad_fisica')
              .where('day', isEqualTo: date.day)
              .where('month', isEqualTo: date.month)
              .where('year', isEqualTo: date.year)
              .get();
      var listaActividadFisica = respuestaFirestore.docs;
      print('listaActividadFisica');
      print(listaActividadFisica);
      for (var actividad in listaActividadFisica) {
        var elemento = actividad.data() as Map<String, dynamic>;
        respuesta.add(ActividadFisicaModel(
            id: elemento["id"],
            actividad: elemento["actividad"],
            valor: elemento["valor"],
            hour: elemento["hour"],
            day: elemento["day"],
            month: elemento["month"],
            year: elemento["year"]));
      }
      return respuesta;
    } catch (e) {
      print('e $e');
      return [];
    }
  }

  Future<List<ActividadAlimentoModel>> listarActividadAlimento(
      String idPaciente, DateTime date) async {
    try {
      List<ActividadAlimentoModel> respuesta = [];
      QuerySnapshot<Object?> respuestaFirestore =
          await pacientesCollectionReference
              .doc(idPaciente)
              .collection('actividad_alimento')
              .where('day', isEqualTo: date.day)
              .where('month', isEqualTo: date.month)
              .where('year', isEqualTo: date.year)
              .get();
      var listaActividadAlimento = respuestaFirestore.docs;
      print('listaActividadAlimento');
      print(listaActividadAlimento);
      for (var actividad in listaActividadAlimento) {
        var elemento = actividad.data() as Map<String, dynamic>;
        respuesta.add(ActividadAlimentoModel(
            id: elemento["id"],
            actividad: elemento["actividad"],
            valor: elemento["valor"],
            hour: elemento["hour"],
            day: elemento["day"],
            month: elemento["month"],
            year: elemento["year"]));
      }
      return respuesta;
    } catch (e) {
      return [];
    }
  }
//   Stream<DocumentSnapshot<Object?>> obtenerGlucosaActual(
//       String idPaciente) async* {
//     Stream<DocumentSnapshot<Object?>> res =
//         await pacientesCollectionReference.doc(idPaciente).snapshots();
//     res.listen((DocumentSnapshot<Object?> event) {
//       var pacienteDB = event.data() as Map<String, dynamic>;

//       print(pacienteDB["glucosa"]);
//         yield pacienteDB["glucosa"]
//     });
//   }

//   obtenerGlucosaActual(String idPaciente) async {
//     print('idPaciente------> $idPaciente');
//     Stream<DocumentSnapshot<Object?>> res =
//         await pacientesCollectionReference.doc(idPaciente).snapshots();

//     var s = res.listen((event) {
//       print('event $event');
//       //   return event;
//     });
//     var f = s.onData((data) {
//       print('data $data');
//     });
//     // yield res;
//     // res.listen((DocumentSnapshot<Object?>  event) {
//     //      var pacienteDB = event.data() as Map<String, dynamic>;
//     //      yield 'sa';
//     // });
//     // yield 'sa';
//   }
}
