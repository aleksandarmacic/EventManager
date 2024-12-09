import 'package:event_manager_app/application/cubits/event/event_cubit.dart';
import 'package:event_manager_app/application/cubits/event/event_states.dart';
import 'package:event_manager_app/domain/repositories/event_repository.dart';
import 'package:event_manager_app/presentation/widgets/app_bar_widget.dart';
import 'package:event_manager_app/presentation/widgets/event_list.dart';
import 'package:event_manager_app/presentation/widgets/floating_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({
    Key? key,
    required this.eventRepository,
  }) : super(key: key);

  final EventRepository eventRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Event Manager'),
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state is EventsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          } else if (state is EventsLoaded) {
            return EventList(
              state: state,
            );
          } else if (state is EventsLoadingFailure) {
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
          }
          return const Center(
            child: Text('Welcome to Event Manager!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButtonWidget(
        eventRepository: eventRepository,
      ),
    );
  }
}
