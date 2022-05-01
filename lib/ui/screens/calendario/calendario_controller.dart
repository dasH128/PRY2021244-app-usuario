import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioController extends GetxController {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
}