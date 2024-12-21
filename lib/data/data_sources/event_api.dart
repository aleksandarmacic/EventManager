import 'dart:convert';
import 'package:event_manager_app/data/models/event_model.dart';
import 'package:flutter/services.dart';

class EventApi {
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString = await rootBundle.loadString('assets/events.json');
    print("ovo je json string");
    print(jsonString);
    print("***********");
    final List<dynamic> jsonData = json.decode(jsonString);
    print("ovo je jsoooooon");
    print(jsonData);
    print("################");
    return jsonData.map((event) => EventModel.fromJson(event)).toList();
  }
}