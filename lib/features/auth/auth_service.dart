import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/core/utils.dart';
import 'package:work_wave_connect/data/models/user_model.dart';
import 'package:work_wave_connect/data/repositories/data_repository.dart';
import 'package:work_wave_connect/features/auth/welcome_screen.dart';
import 'package:work_wave_connect/features/home/home_page.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.idTokenChanges();

  Future<void> signUpWithEmail(
    UserModel user, {
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final usr = FirebaseAuthMethods(FirebaseAuth.instance).user;
      DataRepository().createUser(usr, user);
      
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthWrapper()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      AppUtils.showSnackBar(e.message ?? "Sign up failed", isError: true);
    }
  }

  Future<void> logInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        // ignore: use_build_context_synchronously
        await sendEmailVerification(context);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      AppUtils.showSnackBar(e.message ?? "Login failed", isError: true);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      AppUtils.showSnackBar('Email verification sent!');
    } on FirebaseAuthException catch (e) {
      AppUtils.showSnackBar(e.message ?? "Failed to send verification email", isError: true);
    }
  }

  Future<void> logout() async => _auth.signOut();
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const Welcome();
  }
}
