import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/authentication.dart';

class SignuoController extends GetxController {
  static SignuoController get instance => Get.find();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   phoneController.dispose();
  //   passController.dispose();
  //   super.dispose();
  // }

  GlobalKey<FormState> signupFornKey = GlobalKey<FormState>();

  void registerUser(String email, String password) {
    Authentication.instance.createUserWithEmailAndPassword(email, password);
  }
}
