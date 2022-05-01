import 'package:get/get.dart';

class AutentificacionProvider extends GetConnect {
  Future<bool> login(String correo, String password) async {
    try {
      return true;
    } catch (e) {
        return false;
    }
  }


}
