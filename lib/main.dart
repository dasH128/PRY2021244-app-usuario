import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucoapp/data/providers/providers.dart';
import 'package:glucoapp/ui/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();

  Get.lazyPut(() => AutentificacionProvider());
  Get.lazyPut(() => MedicoProvider());
  Get.lazyPut(() => PacienteProvider());

  runApp(const MyApp());
}
