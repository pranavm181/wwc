import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/features/auth/auth_service.dart';
import 'package:work_wave_connect/features/auth/login_page.dart';
import 'package:work_wave_connect/features/auth/signup_controller.dart';
import 'package:work_wave_connect/features/auth/signup_page.dart';
import 'package:work_wave_connect/features/auth/welcome_screen.dart';
import 'package:work_wave_connect/features/home/home_page.dart';
import 'package:work_wave_connect/firebase_options.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        Provider<SignUpController>(
          create: (_) => SignUpController(),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messengerKey,
        debugShowCheckedModeBanner: false,
        title: 'WWC',
        theme: AppTheme.lightTheme,
        home: const AuthWrapper(),
        routes: {
          SignupScreen.routeName: (context) => const SignupScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
        },
      ),
    );
  }
}


