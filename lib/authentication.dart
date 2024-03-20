import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/data_model.dart';
import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/home_page.dart';
import 'package:work_wave_connect/show_snack_bar.dart';
import 'package:work_wave_connect/welcome_screen.dart';

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

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Navigation();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
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
        Navigator.of(context).pop();
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => Navigation()),
        //   (Route<dynamic> route) => false,
        // );
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification send!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> logout() async => _auth.signOut();
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const Welcome();
  }
}
