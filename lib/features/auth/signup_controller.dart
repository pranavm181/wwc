import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/features/auth/auth_service.dart';
import 'package:work_wave_connect/data/models/booking_model.dart';
import 'package:work_wave_connect/data/models/user_model.dart';
import 'package:work_wave_connect/data/models/worker_model.dart';
import 'package:work_wave_connect/data/repositories/data_repository.dart';

class SignUpController {
  // Use dependency injection for repository
  final DataRepository _repository = DataRepository();

  void registerUser(UserModel user) async {
    user.context.read<FirebaseAuthMethods>().signUpWithEmail(
      user,
      email: user.email,
      password: user.password,
      context: user.context,
    );
  }

  void loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    context.read<FirebaseAuthMethods>().logInWithEmail(
      email: email,
      password: password,
      context: context,
    );
  }

  void addWork(WorkerModel work) async {
    _repository.createWorker(work);
  }

  void addBooking(BookingModel booking) async {
    _repository.doBooking(booking);
  }
}
