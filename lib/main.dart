import 'package:event_manager_app/application/cubits/event/event_cubit.dart';
import 'package:event_manager_app/data/data_sources/event_api.dart';
import 'package:event_manager_app/domain/repositories/event_repository.dart';
import 'package:event_manager_app/presentation/screens/events_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EventManagerApp());
}

class EventManagerApp extends StatelessWidget {
  const EventManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventApi = EventApi();
    final eventRepository = EventRepository(eventApi);
    return MaterialApp(
      title: 'Event Manager',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => EventCubit(
          eventRepository: eventRepository,
        ),
        child: EventsScreen(
          eventRepository: eventRepository,
        ),
      ),
    );
  }
}
