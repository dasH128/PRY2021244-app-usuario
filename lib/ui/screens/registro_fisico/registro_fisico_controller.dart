import 'dart:async';

import 'package:get/get.dart';

class RegistroFisicoController extends GetxController {
  late final stopwatch = Stopwatch();
  Duration cronometro = Duration();
  bool parar = false;

  RegistroFisicoController() {
    iniciar();
  }

  iniciar() {
    cronometro = stopwatch.elapsed;
  }

  limpiar() {
    parar = true;
    print('object');
    restablecer();
  }

  start() {
    stopwatch.start();
    parar = false;
    update();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (parar == false) {
        iniciar();
        update();
      } else {
        timer.cancel();
      }
      //Este codigo se ejecuta cada 20 segundos
    });
  }

  stop() {
    stopwatch.stop();
    parar = true;
    update();
  }

  reset() {
    stopwatch.reset();
  }

  restablecer() {
    stopwatch.reset();
    iniciar();
    update();
  }

  String tiempoTexto() {
    // var sec = (cronometro.inSeconds % 60);
    return '${cronometro.inHours} : ${cronometro.inMinutes} : ${cronometro.inSeconds % 60} ';
  }

  Future<bool> registrar() async {
    return true;
  }
}
