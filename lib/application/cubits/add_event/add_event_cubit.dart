import 'package:event_manager_app/application/cubits/add_event/add_event_states.dart';
import 'package:event_manager_app/data/models/event_model.dart';
import 'package:event_manager_app/domain/repositories/event_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEventCubit extends Cubit<AddEventState> {
  final EventRepository eventRepository;

  String title = '';
  String location = '';
  String description = '';
  DateTime? selectedDate;

  AddEventCubit({required this.eventRepository}) : super(AddEventInitial());

  void updateTitle(String value) {
    title = value;
  }

  void updateLocation(String value) {
    location = value;
  }

  void updateDescription(String value) {
    description = value;
  }

  void updateSelectedDate(DateTime? date) {
    selectedDate = date;
    emit(AddEventInitial());
  }

  Future<void> saveEvent() async {
    if (title.isEmpty || location.isEmpty || description.isEmpty || selectedDate == null) {
      emit(AddEventFailure('Please fill all fields and select a date.'));
      return;
    }

    final newEvent = EventModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      location: location,
      date: selectedDate!,
      description: description,
      isFavorite: false,
    );

    emit(AddEventLoading());
    try {
      eventRepository.addEvent(newEvent);
      emit(AddEventSuccess("You added new event!"));
    } catch (e) {
      emit(AddEventFailure(e.toString()));
    }
  }
}
