import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/historial_clinico/historial_clinico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class HistorialClinicoScreen extends StatelessWidget {
  const HistorialClinicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HistorialClinicoController());

    return GetBuilder<HistorialClinicoController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Historía Clínica'),
          actions: [
            InkWell(
              onTap: () async {
                Navigator.pushNamed(context, 'registro_historial_clinico');
              },
              child: const CircleAvatar(
                child: Icon(Icons.add),
              ),
            ),
            Container(
              width: 15,
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: false,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return _cardHistorialClinica(context);
                }),
          ),
        ),
      );
    });
  }

  Widget _cardHistorialClinica(BuildContext context) {
    return Container(
      //   height: 250,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 15,
        shadowColor: AppTheme.primary.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'fecha',
                style: AppTheme.textEtiquetaTituloStlyle,
              ),
              const SizedBox(height: 10),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text('Motivo'),
              ),
              const SizedBox(height: 15),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                padding: const EdgeInsets.all(8.0),
                //   color: Colors.amber,
                child: Text('Descripción'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
