import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/reporte_medico/reporte_medico_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class ReporteMedicoScreen extends StatelessWidget {
  const ReporteMedicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReporteMedicoController());
    // DateTime dia = ModalRoute.of(context)?.settings.arguments as DateTime;
    var arg = ModalRoute.of(context)?.settings.arguments as List<Object>;
    DateTime dia = arg[0] as DateTime;
    String idPaciente = arg[1] as String;
    // print('argggggggg ${arg.}');
    return GetBuilder<ReporteMedicoController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text('Registro del día')),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 15,
              shadowColor: AppTheme.primary.withOpacity(0.4),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      '${dia.day} ${controller.mesEnString(dia.month)} ',
                      style: AppTheme.textEtiquetaTituloStlyle,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Gráfica de nivel de azucar del día',
                      textAlign: TextAlign.center,
                      style: AppTheme.textEtiquetaStlyle,
                    ),
                    const SizedBox(height: 10),
                    _viewGrafica(),
                    const SizedBox(height: 10),
                    _btnHistorial(context),
                    const SizedBox(height: 10),
                    _btnBitacora(context),
                    const SizedBox(height: 10),
                    _btnRecomendacion(context, controller, idPaciente),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _btnHistorial(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pushNamed(context, 'medico_historial');
        },
        child: const Text(
          'Ver historial físico y alimenticio',
          style: AppTheme.textBtnStlyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _btnBitacora(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pushNamed(context, 'medico_bitacora');
        },
        child: const Text(
          'Ver bitácora',
          style: AppTheme.textBtnStlyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _btnRecomendacion(BuildContext context,
      ReporteMedicoController controller, String idPaciente) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          var f = await _mostrarDialogoAgregarRecomendacion(
              context, controller, idPaciente);
          print('ffffffff $f');
        },
        child: const Text(
          'Agregar recomendación',
          style: AppTheme.textBtnStlyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _viewGrafica() {
    return Container(
      child: AspectRatio(
        aspectRatio: 1.70,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Color(0xff232d37)),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        // bottomTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: true,
        //     reservedSize: 30,
        //     interval: 1,
        //     getTitlesWidget: bottomTitleWidgets,
        //   ),
        // ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    print('bottomTitleWidgets $value');
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  _mostrarDialogoAgregarRecomendacion(BuildContext context,
      ReporteMedicoController controller, String idPaciente) async {
    var respuesta = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Agregar Recomendación'),
            content: TextField(
              maxLines: 8,
              controller: controller.recomendacion,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                label: Text('Ingrese recomendación'),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancelar',
                  style: AppTheme.textBtnStlyle,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var respuesta =
                      await controller.registrarRecomendacion(idPaciente);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Guardar',
                  style: AppTheme.textBtnStlyle,
                ),
              )
            ],
          );
        });
  }
}
