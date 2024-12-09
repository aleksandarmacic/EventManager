import 'package:event_manager_app/application/cubits/add_event/add_event_cubit.dart';
import 'package:event_manager_app/application/cubits/add_event/add_event_states.dart';
import 'package:event_manager_app/presentation/enum/event_field_enum.dart';
import 'package:event_manager_app/presentation/widgets/calendar_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventForm extends StatelessWidget {
  const AddEventForm({
    super.key,
    required this.state,
  });

  final AddEventState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddEventCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ...EventField.values.map((field) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: field.labelText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) => field.onChanged(cubit, value),
              ),
            );
          }).toList(),
          const SizedBox(height: 16),
          CalendarPicker(
            cubit: cubit,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => cubit.saveEvent(),
            child: state is AddEventLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Save Event',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
