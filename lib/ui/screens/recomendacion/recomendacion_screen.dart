import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/recomendacion/recomendacion_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class RecomendacionScreen extends StatelessWidget {
  const RecomendacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RecomendacionController());
    return GetBuilder<RecomendacionController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recomendación'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            //   color: Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 15,
              shadowColor: AppTheme.primary.withOpacity(0.4),
              child: FutureBuilder(
                  future: controller.listarRecomendaciones(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RecomendacionModel>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('Something went wrong'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CustomLoadingPage();
                    }

                    List<RecomendacionModel>? recomendaciones = snapshot.data;
                    return _listaRecomendaciones(controller, recomendaciones!);
                  }),
            ),
          ),
        ),
      );
    });
  }

  Widget _listaRecomendaciones(RecomendacionController controller,
      List<RecomendacionModel> recomendaciones) {
    return ListView.builder(
        itemCount: recomendaciones.length,
        itemBuilder: (context, index) {
          return _cardRecomendacion(
              context, controller, recomendaciones[index]);
        });
  }

  Widget _cardRecomendacion(BuildContext context,
      RecomendacionController controller, RecomendacionModel recomendacion) {
    return CheckboxListTile(
      title: Text(recomendacion.recomendacion),
      controlAffinity: ListTileControlAffinity.trailing,
      value: recomendacion.estado,
      onChanged: (value) async {
        var respuesta =
            await controller.actualizarEstadoRecomendacion(recomendacion);
        if (respuesta == true) {
          controller.update();
        }
      },
    );
  }
}
