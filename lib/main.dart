import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/firebase_options.dart';
import 'package:work_wave_connect/welcome_screen.dart';
//import 'package:work_wave_connect/home_page.dart';
//import 'package:work_wave_connect/welcome_screen.dart';
///import 'package:work_wave_connect/worker_add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(Authentication()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WWC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(235, 171, 164, 166),
        ),
        fontFamily: 'Oswald',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 16, 75, 130),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
