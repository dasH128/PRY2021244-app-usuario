import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class ReporteActividadFisicaController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();

  Future<List<ActividadFisicaModel>> listarActividadFisica(DateTime dia) async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    List<ActividadFisicaModel> lista =
        await pacienteProvider.listarActividadFisica(idUsuario, dia);
    // print('lista esssssss ${lista.length}');
    return lista;
  }
}
