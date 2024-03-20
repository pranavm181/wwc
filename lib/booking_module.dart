import 'package:flutter/material.dart';

class BookingModel {
  final String id;
  final String date;
  final String time;
  final BuildContext context;
  const BookingModel({
    required this.id,
    required this.time,
    required this.date,
    required this.context,
  });
  toJson() {
    return {
      "id": id,
      "time": time,
      "date": date,
    };
  }
}
