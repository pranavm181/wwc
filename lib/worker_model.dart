import 'package:flutter/material.dart';

class WorkerModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String? work;
  final String age;
  //final Gender? gender;
  final String discription;
  final String place;
  final String img;
  final BuildContext context;
  const WorkerModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
    required this.work,
    required this.age,
    //required this.gender,
    required this.discription,
    required this.place,
    required this.context,
  });
  toJson() {
    return {
      "name": name,
      "email": email,
      "phno": phone,
      "work": work,
      "place": place,
      "discription": discription,
      "age": age,
      "workerImage": img,
      // "Gender": gender,
    };
  }
}
