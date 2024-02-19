import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/home_page.dart';
import 'package:work_wave_connect/welcome_screen.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const HomePage())
        : Get.offAll(() => const Welcome());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuth catch (e) {

    }catch(_){}
  }
  Future<void> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuth catch (e) {

    }catch(_){}
}

}