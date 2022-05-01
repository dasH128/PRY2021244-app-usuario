import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.lightBlue;
  static const double heightInputs = 45;
  static const Color fondo = Colors.white70;
  static const TextStyle textBtnStlyle = TextStyle(
    fontSize: 20.0,
  );

  static const TextStyle textEtiquetaTituloStlyle = TextStyle(
      fontSize: 18.0,
      color: Colors.blueGrey,
      letterSpacing: 2.1,
      fontWeight: FontWeight.bold);

  static const TextStyle textEtiquetaStlyle = TextStyle(
      fontSize: 15.0,
      color: Colors.blueGrey,
      letterSpacing: 1.8,
      fontWeight: FontWeight.bold);

  static const TextStyle textStlyle = TextStyle(
      fontSize: 15.0,
      color: Colors.black87,
      fontFamily: 'Roboto',
      letterSpacing: 1.2,
      fontWeight: FontWeight.w400);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: fondo);
}
