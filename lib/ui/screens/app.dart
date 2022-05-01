import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/routes/app_routes.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'raa',
      initialRoute: AppRoutes.initialRouter,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme
    );
  }
}