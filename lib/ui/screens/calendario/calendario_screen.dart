import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glucoapp/ui/screens/calendario/calendario_controller.dart';
import 'package:glucoapp/ui/themes/app_themes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarioController());

    return GetBuilder<CalendarioController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Calendario'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 15,
            shadowColor: AppTheme.primary.withOpacity(0.4),
            child: TableCalendar(
                headerStyle: const HeaderStyle(formatButtonVisible: false),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                headerVisible: true,
                calendarFormat: controller.calendarFormat,
                onFormatChanged: (format) {
                  if (controller.calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    controller.calendarFormat = format;
                    controller.update();
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay, day);
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  if (!isSameDay(controller.selectedDay, selectedDay)) {
                    // controller.selectedDay = selectedDay;
                    // controller.focusedDay = focusedDay;
                    // controller.update();
                    Navigator.pushNamed(context, 'menu_reporte_dia',
                        arguments: selectedDay);
                  }
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay = focusedDay;
                }),
          ),
        ),
      );
    });
  }
}
