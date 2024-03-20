import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/booking_module.dart';
import 'package:work_wave_connect/data_model.dart';
import 'package:work_wave_connect/worker_model.dart';

class DataRepository {
  final _db = FirebaseFirestore.instance;

  createUser(usr, UserModel user) async {
    await _db
        .collection('Users')
        .doc(usr.uid)
        .collection('user')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created"),
        )
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Somthing went wrong.Try again");
      print(error.toString());
    });
  }

  createWorker(WorkerModel work) async {
    await _db.collection('Work').add(work.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your data has been added"),
        );
  }

  doBooking(BookingModel booking) async {
    await _db.collection('Booking').add(booking.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your data has been added"),
        );
  }

  Future<Stream<QuerySnapshot>> getJobDetails() async {
    return await FirebaseFirestore.instance.collection('Work').snapshots();
  }

  Future<Stream<QuerySnapshot>> getBookingDetails() async {
    return await FirebaseFirestore.instance.collection('Booking').snapshots();
  }
}
