import 'package:event_manager_app/application/cubits/event/event_states.dart';
import 'package:event_manager_app/data/models/event_model.dart';
import 'package:event_manager_app/domain/repositories/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository eventRepository;

  EventCubit({
    required this.eventRepository,
  }) : super(InitialEventState()) {
    fetchEvents();
    listenForAddingEvents();
  }

  void fetchEvents() async {
    emit(EventsLoading());
    try {
      final events = await eventRepository.fetchEvents();
      emit(EventsLoaded(events: events));
    } catch (_) {
      emit(
        EventsLoadingFailure(
          errorMessage: 'Failed to load events.',
        ),
      );
    }
  }

  void listenForAddingEvents() {
    eventRepository.eventStream.listen((event) {
      addEvent(event);
    });
  }

  void addEvent(EventModel event) {
    if (state is EventsLoaded) {
      final currentState = state as EventsLoaded;
      emit(
        currentState.copyWith(
          events: [
            ...currentState.events,
            event,
          ],
        ),
      );
    }
  }
}
