import 'dart:convert';

class ActividadFisicaModel {
  ActividadFisicaModel({
    required this.id,
    required this.actividad,
    required this.valor,
    required this.hour,
    required this.day,
    required this.month,
    required this.year,
  });

  final int id;
  final String actividad;
  final String valor;
  final String hour;
  final int day;
  final int month;
  final int year;

  factory ActividadFisicaModel.fromJson(String str) =>
      ActividadFisicaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActividadFisicaModel.fromMap(Map<String, dynamic> json) =>
      ActividadFisicaModel(
        id: json["id"] ?? '',
        actividad: json["actividad"] ?? '',
        valor: json["valor"] ?? '',
        hour: json["hour"],
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "actividad": actividad,
        "valor": valor,
        "hour": hour,
        "day": day,
        "month": month,
        "year": year,
      };
}
