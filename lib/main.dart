import 'package:flutter/material.dart';
import 'package:work_wave_connect/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WWC',
      theme: ThemeData(
          fontFamily: 'Oswald',
          textTheme: const TextTheme(
              titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ))),
      home: const HomePage(),
    );
  }
}
