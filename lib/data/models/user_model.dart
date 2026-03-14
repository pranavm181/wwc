import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final BuildContext context;
  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.context,
  });
  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Phone": phone,
      "Password": password,
    };
  }
}
