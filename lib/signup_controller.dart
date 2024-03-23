import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/booking_module.dart';
import 'package:work_wave_connect/data_model.dart';
import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/worker_model.dart';

class SignUpController {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final age = TextEditingController();
  final place = TextEditingController();
  final discription = TextEditingController();
  final yearOfExp = TextEditingController();

  void registerUser(UserModel user) async {
    user.context.read<FirebaseAuthMethods>().signUpWithEmail(user,
        email: user.email, password: user.password, context: user.context);
  }

  void loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    context
        .read<FirebaseAuthMethods>()
        .logInWithEmail(email: email, password: password, context: context);
  }

  void addWork(WorkerModel work) async {
    DataRepository().createWorker(work);
  }

  void addBooking(BookingModel booking) async {
    DataRepository().doBooking(booking);
  }
}
