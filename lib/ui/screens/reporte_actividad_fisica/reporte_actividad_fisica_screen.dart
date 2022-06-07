import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/reporte_actividad_fisica/reporte_actividad_fisica_controller.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class ReporteActividadFisicaScreen extends StatelessWidget {
  const ReporteActividadFisicaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReporteActividadFisicaController());
    DateTime dia = ModalRoute.of(context)?.settings.arguments as DateTime;
    print('dia $dia');
    return GetBuilder<ReporteActividadFisicaController>(builder: (controller) {
      //   controller.listarActividadFisica(dia);
      return Scaffold(
        appBar: AppBar(
          title: const Text('Actividad Física'),
        ),
        body: Container(
          //   color: Colors.yellow,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 60,
                color: Colors.red,
                child: Center(child: Text('ESTADO')),
              ),
              tablaDatos(controller, dia)
            ],
          ),
        ),
      );
    });
  }

  Widget tablaDatos(ReporteActividadFisicaController controller, DateTime dia) {
    return FutureBuilder(
      future: controller.listarActividadFisica(dia),
      builder: (BuildContext context,
          AsyncSnapshot<List<ActividadFisicaModel>> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingPage();
        }
        List<ActividadFisicaModel>? lista = snapshot.data;
        final rows = <TableRow>[
          const TableRow(
            children: [
              Text('#'),
              Text('Hora'),
              Text('Actividad'),
              Text('Tiempo')
            ],
          ),
        ];
        for (var elemento in lista!) {
          rows.add(TableRow(children: [
            Text('${elemento.id}'),
            Text('${elemento.hour}'),
            Text('${elemento.actividad}'),
            Text('${elemento.valor}'),
          ]));
        }

        return Card(
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(1.0),
              1: FlexColumnWidth(2.0),
            },
            border: TableBorder.all(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: rows,
          ),
        );
      },
    );
  }
}
