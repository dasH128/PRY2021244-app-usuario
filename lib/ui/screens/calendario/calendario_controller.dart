import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioController extends GetxController {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  String isPaciente() {
    var storage = GetStorage();
    var t = storage.read<String>('usuarioTipo') ?? '';
    print('tttttttttt $t');
    return t;
  }
}
