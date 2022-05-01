import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/login/login_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.correo,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Usuario'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.password,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Contraseña'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: AppTheme.heightInputs,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, 'home_paciente');
                      //   await controller.login();
                    },
                    child:
                        const Text('Continuar', style: AppTheme.textBtnStlyle),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () async {
                      Navigator.pushReplacementNamed(
                          context, 'olvido_password');
                    },
                    child: const Text(
                      '¿Has olvidado la contraseña?',
                      style: AppTheme.textEtiquetaStlyle,
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
