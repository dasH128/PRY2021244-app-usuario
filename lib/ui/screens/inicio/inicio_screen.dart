import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'GlucoMed',
                  style: TextStyle(
                      fontSize: 52.0,
                      color: AppTheme.primary,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w800),
                ),
                const Text(
                  'inicia tu monitoreo',
                  style: AppTheme.textEtiquetaTituloStlyle,
                ),
                Container(height: 390),
                SizedBox(
                  //   color: Colors.red,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppTheme.heightInputs,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, 'login');
                            },
                            child: const Text('Iniciar Sesión',
                              style: AppTheme.textBtnStlyle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: AppTheme.heightInputs,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () async {
                              Navigator.pushReplacementNamed(
                                  context, 'registro_paciente');
                            },
                            child: const Text(
                              'Registrar Paciente',
                              style: AppTheme.textBtnStlyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
