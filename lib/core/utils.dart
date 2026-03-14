import 'package:flutter/material.dart';
import 'package:work_wave_connect/main.dart';

class AppUtils {
  static void showSnackBar(String message, {bool isError = false}) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontFamily: 'Oswald'),
        ),
        backgroundColor: isError ? Colors.redAccent : Colors.green[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
