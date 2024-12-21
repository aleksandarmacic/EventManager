import 'package:event_manager_app/data/models/event_model.dart';

abstract class EventState {}

class InitialEventState extends EventState {
  final List<EventModel> events;


  InitialEventState({
    this.events = const [],
  });
}

class EventsLoading extends EventState {}

class EventsLoaded extends EventState {
  final List<EventModel> events;

  EventsLoaded({required this.events});

  EventsLoaded copyWith({
    List<EventModel>? events,
  }) {
    return EventsLoaded(
      events: events ?? this.events,
    );
  }
}

class EventsLoadingFailure extends EventState {
  final String errorMessage;

  EventsLoadingFailure({required this.errorMessage});
}
