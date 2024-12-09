import "package:json_annotation/json_annotation.dart";

part "event_model.g.dart";
@JsonSerializable()
class EventModel {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String description;
  final bool isFavorite;

  EventModel({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.description,
    this.isFavorite = false,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  EventModel copyWith({
    String? id,
    String? title,
    String? location,
    DateTime? date,
    String? description,
    bool? isFavorite,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}