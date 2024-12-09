import 'dart:async';
import 'package:event_manager_app/data/data_sources/event_api.dart';
import 'package:event_manager_app/data/models/event_model.dart';

class EventRepository {
  EventRepository(
      this._eventApi,
      );

  final EventApi _eventApi;

  final StreamController<EventModel> _eventStreamController = StreamController.broadcast();

  Stream<EventModel> get eventStream => _eventStreamController.stream;

  Future<List<EventModel>> fetchEvents() async {
    final response = await _eventApi.getEvents();
    return response;
  }

  void addEvent(EventModel event) {
    _eventStreamController.add(event);
  }

  void dispose() {
    _eventStreamController.close();
  }
}