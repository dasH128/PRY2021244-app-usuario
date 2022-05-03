import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AutentificacionProvider extends GetConnect {
  Future<Map<String, dynamic>> login(String correo, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: correo, password: password);
      Map<String, dynamic> res = {"login": true, "id": credential.user!.uid};
      return res;
    } catch (e) {
      Map<String, dynamic> res = {"login": false, "id": ""};
      return res;
    }
  }
}
