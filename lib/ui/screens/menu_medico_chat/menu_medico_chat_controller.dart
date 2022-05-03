import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/medico_provider.dart';
import 'package:glucoapp/domain/models.dart';

class MenuMedicoChatController extends GetxController {
  final medicoProvider = Get.find<MedicoProvider>();
  Future<List<PacienteModel>> listarPacientesdelMedico() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var lista = await medicoProvider.listarPacientesdelMedico(idUsuario);

    return lista;
  }
}
