import 'dart:convert';

class ActividadModel {
  ActividadModel({
    required this.tipo,
    required this.comentario,
    // required this.estado,
  });

  final String tipo;
  final String comentario;
//   late bool estado = false;

  factory ActividadModel.fromJson(String str) =>
      ActividadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActividadModel.fromMap(Map<String, dynamic> json) => ActividadModel(
        tipo: json["tipo"] ?? 0,
        // estado: json["estado"],
        comentario: json["comentario"],
      );

  Map<String, dynamic> toMap() => {
        "tipo": tipo,
        "comentario": comentario,
      };
}
