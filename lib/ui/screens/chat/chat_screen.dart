import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/chat/chat_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    Size size = MediaQuery.of(context).size;

    return GetBuilder<ChatController>(builder: (controller) {
      var tipoUsuario = controller.tipoUsuario();

      return Scaffold(
        appBar: AppBar(
            backgroundColor: AppTheme.primary,
            title: Container(
              // color: Colors.red,
              child: Row(
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Cuenta Usuario'),
                ],
              ),
            )
            // leading: Icon(Icons.person),
            ),
        body: Container(
          // color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                top: 5,
                bottom: 70,
                child: Container(
                  color: Colors.red,
                  width: size.width * 1,
                  height: size.height - 50,
                  child: ListView.builder(
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return _chatContainer();
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  // color: Colors.green,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        //   color: Colors.red,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          //   controller: controller.nombre,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              hintText: ''),
                        ),
                      )),
                      InkWell(
                        onTap: () async {
                          controller.enviarMensaje(tipoUsuario);
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.send),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _chatContainer() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primary,
        border: Border.all(
          color: Colors.blueAccent,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(5),
      child: Text(
          'MotivMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaMotivoaoa'),
    );
  }
}
