import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/reporte_dia/reporte_dia_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class ReporteDiaScreen extends StatelessWidget {
  const ReporteDiaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReporteDiaController());
    var arg = ModalRoute.of(context)?.settings.arguments as List<Object>;
    DateTime dia = arg[0] as DateTime;

    return GetBuilder<ReporteDiaController>(builder: (controller) {
      //   controller.obtenerGlucosaPorDia();
      return Scaffold(
        appBar: AppBar(title: const Text('Registro del día')),
        body: FutureBuilder(
            future: controller.obtenerGlucosaPorDia(dia),
            builder: (BuildContext context,
                AsyncSnapshot<List<PuntoModel>> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingPage();
              }
              List<PuntoModel>? lista = snapshot.data;
              return _viewGeneral(controller, context, lista!, dia);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _mostrarDialogoAgregarComentario(context, controller);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }

  Widget _viewGeneral(
      ReporteDiaController controller, BuildContext context,
      List<PuntoModel> data, DateTime dia) {
    print(data.length);
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
              _viewGrafica(data),
              const SizedBox(height: 10),
              _viewActividadFisica(context, dia),
              const SizedBox(height: 10),
              _viewActividadAlimento(context, dia),
              _viewBitacora(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewGrafica(List<PuntoModel> data) {
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
              mainData(data),
            ),
          ),
        ),
      ),
    );
  }

  Widget _viewActividadFisica(BuildContext context, DateTime dia) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'reporte_fisico', arguments: dia);
        },
        child: const Text(
          'Reporte Activdad Física',
          style: AppTheme.textBtnStlyle,
        ),
      ),
    );
  }

  Widget _viewActividadAlimento(BuildContext context, DateTime dia) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'reporte_alimento', arguments: dia);
        },
        child: const Text(
          'Reporte Activdad Alimenticia',
          style: AppTheme.textBtnStlyle,
        ),
      ),
    );
  }

  Widget _viewBitacora() {
    return Container(
        //   clipBehavior: Clip.antiAlias,
        //   child: Row(
        //     children: [
        //       Text('data'),
        //       Text('data'),
        //     ],
        //   ),
        );
  }

  _mostrarDialogoAgregarComentario(
      BuildContext context, ReporteDiaController controller) async {
    var respuesta = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Agregar Comentario'),
            content: TextField(
              maxLines: 8,
              controller: controller.comentario,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                label: Text('Ingrese Comentario'),
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
                  var respuesta = await controller.registrarComentario();
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

  LineChartData mainData(List<PuntoModel> data) {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    List<FlSpot> listLineChart = [];
    for (var item in data) {
      print('${item.ejeX} ${item.ejeY}');
      listLineChart.add(FlSpot(item.ejeX.toDouble(), item.ejeY.toDouble()));
    }
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
      maxX: 1440,
      minY: 0,
      maxY: 220,
      lineBarsData: [
        LineChartBarData(
          //   spots: const [
          //     FlSpot(0, 111),
          //     FlSpot(1, 104),
          //     FlSpot(9, 120),
          //     // FlSpot(6.8, 3.1),
          //     // FlSpot(8, 4),
          //     // FlSpot(9.5, 3),
          //     // FlSpot(11, 4),
          //   ],
          spots: listLineChart,
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
    print('bottomTitleWidgetssss $value');
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
      case 70:
        text = 'Hipo';
        break;
      case 120:
        text = 'Nor';
        break;
      case 180:
        text = 'Elev';
        break;
      case 200:
        text = 'Hipe';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
