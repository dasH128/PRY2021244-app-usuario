import 'dart:convert';

class BitacoraModel {
  BitacoraModel({
    required this.time,
    required this.comentario,
    // required this.estado,
  });

  final int time;
  final String comentario;
//   late bool estado = false;

  factory BitacoraModel.fromJson(String str) =>
      BitacoraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BitacoraModel.fromMap(Map<String, dynamic> json) => BitacoraModel(
        time: json["time"] ?? 0,
        // estado: json["estado"],
        comentario: json["comentario"],
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "comentario": comentario,
      };
}
