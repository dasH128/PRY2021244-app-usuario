import 'package:get/get.dart';

class RecomendacionController extends GetxController {
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
}
