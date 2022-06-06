import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class RecomendacionController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();

  bool recomendacion1 = false;
  bool recomendacion2 = false;
  bool recomendacion3 = false;
  bool recomendacion4 = false;

  setRespuesta(bool value, int pregunta) {
    switch (pregunta) {
      case 1:
        recomendacion1 = value;
        break;
      case 2:
        recomendacion2 = value;
        break;
      case 3:
        recomendacion3 = value;
        break;
      case 4:
        recomendacion4 = value;
        break;
      default:
    }

    update();
  }

  Future<List<RecomendacionModel>> listarRecomendaciones() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var lista = await pacienteProvider.listarRecomendaciones(idUsuario);
    return lista;
  }

  Future<bool> actualizarEstadoRecomendacion(
      RecomendacionModel recomendacion) async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var lista = await pacienteProvider.actualizarEstadoRecomendacion(
        idUsuario, recomendacion);
    return lista;
  }
}
