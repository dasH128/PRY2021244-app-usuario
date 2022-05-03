import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class PerfilPacienteController extends GetxController {
  final pacienteProvider = Get.find<PacienteProvider>();

  Future<PacienteModel> buscarPaciente() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    return await pacienteProvider.buscarPacientePorId(idUsuario);
  }
}
