import 'dart:convert';


class MedicoModel {
  final String id;
  final String nombre;
  final String apellidos;
  final String numero;
  final String dni;
  final String numeroCpi;
//   final DateTime fecha;
  final String especialidad;
  final String experiencia;
  late bool estado = false;
  final String correo;
  String? password;
  DateTime? launchDate;

  MedicoModel({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.numero,
    required this.dni,
    required this.numeroCpi,
    // required this.fecha,
    required this.especialidad,
    required this.experiencia,
    required this.correo,
    this.estado = false,
  });

//   set setId(String id) {
//     this.id = id;
//   }

  factory MedicoModel.fromJson(String str) =>
      MedicoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicoModel.fromMap(Map<String, dynamic> json) => MedicoModel(
        id: json["id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        numero: json["numero"],
        dni: json["dni"],
        numeroCpi: json["numeroCpi"],
        // fecha: json["fecha"],
        especialidad: json["especialidad"],
        experiencia: json["experiencia"],
        estado: json["estado"],
        correo: json["correo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "numero": numero,
        "dni": dni,
        "numeroCpi": numeroCpi,
        // "fecha": fecha,
        "especialidad": especialidad,
        "experiencia": experiencia,
        "estado": estado,
        "correo": correo,
      };


}
