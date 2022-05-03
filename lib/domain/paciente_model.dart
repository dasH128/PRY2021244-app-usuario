import 'dart:convert';

class PacienteModel {
  PacienteModel({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.numero,
    required this.dni,
    required this.direccion,
    required this.medicoId,
    required this.medicoEstado,
    required this.correo,
    final this.descripcion = '',
    this.estado = true,
  });

  final String id;
  final String nombre;
  final String apellidos;
  final String numero;
  final String dni;
  final String direccion;
  final String medicoId;
  final String medicoEstado;
  late bool estado = true;
  final String correo;
  final String descripcion;

  factory PacienteModel.fromJson(String str) =>
      PacienteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PacienteModel.fromMap(Map<String, dynamic> json) => PacienteModel(
        id: json["id"] ?? '',
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        numero: json["numero"],
        dni: json["dni"],
        direccion: json["direccion"],
        medicoId: json["medicoId"],
        medicoEstado: json["medicoEstado"],
        estado: json["estado"],
        correo: json["correo"],
        descripcion: json["descripcion"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "numero": numero,
        "dni": dni,
        "direccion": direccion,
        "medicoId": medicoId,
        "medicoEstado": medicoEstado,
        "estado": estado,
        "correo": correo,
      };
}
