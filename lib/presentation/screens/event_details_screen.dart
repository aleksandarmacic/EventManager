import 'package:event_manager_app/data/models/event_model.dart';
import 'package:event_manager_app/presentation/enum/event_detail_type_enum.dart';
import 'package:event_manager_app/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: "Event Details",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: EventDetailTypeEnum.values.map((detailType) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                detailType.label(event),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
