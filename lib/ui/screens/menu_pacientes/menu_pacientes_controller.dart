import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/domain/models.dart';

class MenuPacientesController extends GetxController {
  final medicoProvider = Get.find<MedicoProvider>();

  Future<List<PacienteModel>> listarPacientesdelMedico() async {
    var storage = GetStorage();
    var idUsuario = await storage.read('idUsuario');
    var lista = await medicoProvider.listarPacientesdelMedico(idUsuario);

    return lista;
  }

  Future<bool> cambiarEstadoPaciente(PacienteModel paciente) async {
    var respuesta = await medicoProvider.cambiarEstadoPaciente(paciente);
    print('cambiarEstadoMedico $respuesta');
    // update();
    return respuesta;
  }
}