import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/paciente_provider.dart';
import 'package:glucoapp/domain/models.dart';

class ReporteActividadAlimentoController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();

  Future<List<ActividadAlimentoModel>> listarActividadAlimento(
      DateTime dia) async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    List<ActividadAlimentoModel> lista =
        await pacienteProvider.listarActividadAlimento(idUsuario, dia);
    // print('lista esssssss ${lista.length}');
    return lista;
  }
}
