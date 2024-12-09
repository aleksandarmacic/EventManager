import 'package:event_manager_app/data/models/event_model.dart';

enum EventDetailTypeEnum {
  title,
  location,
  date,
  description,
}

extension EventDetailTypeExtension on EventDetailTypeEnum {
  String label(EventModel event) {
    switch (this) {
      case EventDetailTypeEnum.title:
        return event.title;
      case EventDetailTypeEnum.location:
        return '📍 Location: ${event.location}';
      case EventDetailTypeEnum.date:
        return '📅 Date: ${event.date.toLocal().toString().split(" ")[0]}';
      case EventDetailTypeEnum.description:
        return '📝 Description:\n${event.description}';
    }
  }
}
