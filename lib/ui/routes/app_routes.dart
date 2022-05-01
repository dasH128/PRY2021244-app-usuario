import 'package:flutter/material.dart';
import 'package:glucoapp/ui/screens/screens.dart';

class AppRoutes {
  static const initialRouter = 'loading';
  static Map<String, Widget Function(BuildContext)> routes = {
    'loading': (BuildContext context) => const LoadingScreen(),
    'inicio': (BuildContext context) => const InicioScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'registro_paciente': (BuildContext context) =>
        const RegistroPacienteScreen(),
    'registro_medico': (BuildContext context) => const RegistroMedicoScreen(),
    // PACIENTE
    'home_paciente': (BuildContext context) => const HomePacienteScreen(),
    'olvido_password': (BuildContext context) => const OlvidoPasswordScreen(),
    'paciente_resumen': (BuildContext context) => const PacienteResumenScreen(),
    'menu_registro_fisico': (BuildContext context) =>
        const RegistroFisicoScreen(),
    'menu_registro_alimentacion': (BuildContext context) =>
        const RegistroAlimentacionScreen(),
    'menu_reporte_diario': (BuildContext context) =>
        const RegistroFisicoScreen(),
    'menu_calendario': (BuildContext context) => const CalendarioScreen(),

    // MEDICO
    'home_medico': (BuildContext context) => const HomeMedicoScreen(),
  };
}
