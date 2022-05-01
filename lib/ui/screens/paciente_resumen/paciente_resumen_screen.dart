import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/paciente_resumen/paciente_resumen_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class PacienteResumenScreen extends StatelessWidget {
  const PacienteResumenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PacienteController());

    return GetBuilder<PacienteController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Resumen Semanal'),
        ),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _cardMenuPrincipal(context, controller),
                _cardMenuFooter(context, controller),
              ],
            ),
          ),
        )),
      );
    });
  }

  Widget _cardMenuPrincipal(
      BuildContext context, PacienteController controller) {
    return SizedBox(
        width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: Column(
            children: [
                Text('Media Semanal', style: AppTheme.textEtiquetaTituloStlyle),
                Text('120 ', style: AppTheme.textEtiquetaStlyle),
            ],
        ),
      ),
    );
  }

  Widget _cardMenuFooter(BuildContext context, PacienteController controller) {
    return SizedBox(
      width: double.infinity,
      height: 110,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 180,
              child: Text(
                'Recomendaciones del médico',
                textAlign: TextAlign.center,
                style: AppTheme.textBtnStlyle,
              ),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text(
                'Ver Aqui',
                style: AppTheme.textBtnStlyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
