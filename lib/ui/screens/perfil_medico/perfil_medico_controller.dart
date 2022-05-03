import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class PerfilMedicoController extends GetxController {
  final medicoProvider = Get.find<MedicoProvider>();

  Future<MedicoModel> buscarPaciente() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    return await medicoProvider.buscarMedicoPorId(idUsuario);
  }
}
