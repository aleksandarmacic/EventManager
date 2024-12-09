// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'isFavorite': instance.isFavorite,
    };
