import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/domain/models.dart';
import 'package:glucoapp/ui/screens/menu_medico_chat/menu_medico_chat_controller.dart';
import 'package:glucoapp/ui/widgets/custom_loading_page.dart';

class MenuMedicoChatScreen extends StatelessWidget {
  const MenuMedicoChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuMedicoChatController());

    return GetBuilder<MenuMedicoChatController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Chats'),
        ),
        body: FutureBuilder(
          future: controller.listarPacientesdelMedico(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PacienteModel>> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingPage();
            }

            List<PacienteModel>? pacientes = snapshot.data;

            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    // shrinkWrap: false,
                    itemCount: pacientes!.length,
                    itemBuilder: (context, index) {
                      return _cardMenuPaciente(context, pacientes[index]);
                    }),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _cardMenuPaciente(BuildContext context, PacienteModel paciente) {
    return Container(
      height: 70,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.person),
          onTap: () async {
            Navigator.pushNamed(context, 'chat');
          },
          title: Text(paciente.nombre),
        ),
      ),
    );
  }
}
