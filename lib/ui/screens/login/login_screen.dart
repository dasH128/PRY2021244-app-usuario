import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/login/login_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:glucoapp/ui/utils/display_dialog_android.dart';
import 'package:glucoapp/ui/widgets/custom_loading_button.dart';

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
                  child: _crearBotonContinuar(context, controller),
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

  Widget _crearBotonContinuar(
      BuildContext context, LoginController controller) {
    if (controller.isLoading == true) {
      return const CustomLoadingButton();
    } else {
      return ElevatedButton(
        onPressed: () async {
          var isLogin200 = await controller.login();
          if (isLogin200["login"] == true) {
            controller.limpiarCampos();
            if (isLogin200["tipo"] == 'paciente') {
              Navigator.pushReplacementNamed(context, 'home_paciente');
            } else {
              Navigator.pushReplacementNamed(context, 'home_medico');
            }
          } else {
            await displayDialogAndroid(
                context, '', isLogin200["tipo"], Icons.highlight_off_outlined);
          }
        },
        child: const Text('Continuar', style: AppTheme.textBtnStlyle),
      );
    }
  }
}
