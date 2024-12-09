import 'package:event_manager_app/application/cubits/event/event_states.dart';
import 'package:event_manager_app/presentation/widgets/event_list_tile_widget.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({
    super.key,
    required this.state,
  });

  final EventsLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.events.length,
            itemBuilder: (context, index) {
              final event = state.events[index];
              return EventListTile(event: event);
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
