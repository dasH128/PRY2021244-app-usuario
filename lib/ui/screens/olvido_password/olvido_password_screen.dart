import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/olvido_password/olvido_password_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class OlvidoPasswordScreen extends StatelessWidget {
  const OlvidoPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OlvidoPasswordController());

    return GetBuilder<OlvidoPasswordController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Ingrese el correo electrónico con el que te registrastes',
                        style: AppTheme.textEtiquetaStlyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 45,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.correo,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: 'Correo electrónico'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushReplacementNamed(
                                context, 'loading');
                          },
                          child: const Text('Continuar',
                              style: AppTheme.textBtnStlyle),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
// OlvidoPasswordController