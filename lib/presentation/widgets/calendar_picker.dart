import 'package:event_manager_app/application/cubits/add_event/add_event_cubit.dart';
import 'package:flutter/material.dart';

class CalendarPicker extends StatelessWidget {
  const CalendarPicker({
    super.key,
    required this.cubit,
  });

  final AddEventCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        cubit.selectedDate == null
            ? 'Select Event Date'
            : 'Date: ${cubit.selectedDate.toString().split(" ")[0]}',
        style: const TextStyle(fontSize: 16),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.calendar_today,
          color: Colors.blueAccent,
        ),
        onPressed: () async {
          final now = DateTime.now();
          final picked = await showDatePicker(
            context: context,
            initialDate: now,
            firstDate: now,
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          cubit.updateSelectedDate(picked);
        },
      ),
    );
  }
}
