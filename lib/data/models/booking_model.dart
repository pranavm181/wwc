import 'package:flutter/material.dart';

class BookingModel {
  final String? id; // Booking ID
  final String workerId; // ID of the booked worker
  final String userId; // ID of the user booking
  final String workerName; 
  final String workerService;
  final String date;
  final String time;
  final String status; // Pending, Confirmed, Completed, Cancelled
  final String userEmail; 

  const BookingModel({
    this.id,
    required this.workerId,
    required this.userId,
    required this.workerName,
    required this.workerService,
    required this.date,
    required this.time,
    this.status = 'Pending',
    required this.userEmail,
  });

  Map<String, dynamic> toJson() {
    return {
      "workerId": workerId,
      "userId": userId,
      "workerName": workerName,
      "workerService": workerService,
      "date": date,
      "time": time,
      "status": status,
      "userEmail": userEmail,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    };
  }
}
