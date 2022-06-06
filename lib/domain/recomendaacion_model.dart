import 'dart:convert';

class RecomendacionModel {
  RecomendacionModel({
    required this.time,
    required this.recomendacion,
    required this.estado,
  });

  final int time;
  final String recomendacion;
  late bool estado = false;

  factory RecomendacionModel.fromJson(String str) =>
      RecomendacionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecomendacionModel.fromMap(Map<String, dynamic> json) =>
      RecomendacionModel(
        time: json["time"] ?? '',
        estado: json["estado"],
        recomendacion: json["recomendacion"],
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "estado": estado,
        "recomendacion": recomendacion,
      };
}
