import 'package:flutter/material.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      child: Icon(Icons.send),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
