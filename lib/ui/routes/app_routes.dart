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
    'chat': (BuildContext context) => const ChatScreen(),
    
    
    // PACIENTE
    'home_paciente': (BuildContext context) => const HomePacienteScreen(),
    'perfil_paciente': (BuildContext context) => const PerfilPacienteScreen(),
    'olvido_password': (BuildContext context) => const OlvidoPasswordScreen(),
    'paciente_resumen': (BuildContext context) => const PacienteResumenScreen(),
    'menu_registro_fisico': (BuildContext context) =>
        const MenuRegistroFisicoScreen(),
    'registro_fisico': (BuildContext context) => const RegistroFisicoScreen(),
    'menu_registro_alimentacion': (BuildContext context) =>
        const MenuRegistroAlimentacionScreen(),
    'registro_alimentacion': (BuildContext context) =>
        const RegistroAlimentacionScreen(),
    'menu_reporte_dia': (BuildContext context) => const ReporteDiaScreen(),
    'menu_calendario': (BuildContext context) => const CalendarioScreen(),
    'recomendacion': (BuildContext context) => const RecomendacionScreen(),

    // MEDICO
    'home_medico': (BuildContext context) => const HomeMedicoScreen(),
    'perfil_medico': (BuildContext context) => const PerfilMedicoScreen(),
    'menu_pacientes': (BuildContext context) => const MenuPacientesScreen(),
    'menu_reportes': (BuildContext context) => const MenuReportesScreen(),
    'menu_medico_chat': (BuildContext context) => const MenuMedicoChatScreen(),
    'menu_historial_clinico': (BuildContext context) =>
        const MenuHistorialClinicoScreen(),
    'historial_clinico': (BuildContext context) =>
        const HistorialClinicoScreen(),
    'registro_historial_clinico': (BuildContext context) =>
        const RegistroHistorialClinicoScreen(),

  };
}
