import 'package:event_manager_app/application/cubits/add_event/add_event_cubit.dart';

enum EventField { title, location, description }

extension EventFieldExtension on EventField {
  String get labelText {
    switch (this) {
      case EventField.title:
        return 'Event Title';
      case EventField.location:
        return 'Location';
      case EventField.description:
        return 'Description';
    }
  }

  void onChanged(AddEventCubit cubit, String value) {
    switch (this) {
      case EventField.title:
        cubit.updateTitle(value);
        break;
      case EventField.location:
        cubit.updateLocation(value);
        break;
      case EventField.description:
        cubit.updateDescription(value);
        break;
    }
  }

  int get maxLines {
    switch (this) {
      case EventField.description:
        return 3;
      default:
        return 1;
    }
  }
}
