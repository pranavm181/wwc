import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_wave_connect/core/utils.dart';
import 'package:work_wave_connect/data/models/booking_model.dart';
import 'package:work_wave_connect/data/models/user_model.dart';
import 'package:work_wave_connect/data/models/worker_model.dart';

class DataRepository {
  final _db = FirebaseFirestore.instance;

  createUser(usr, UserModel user) async {
    try {
      await _db
          .collection('Users')
          .doc(usr.uid)
          .collection('user')
          .add(user.toJson());
      AppUtils.showSnackBar("Your account has been created");
    } catch (error) {
      AppUtils.showSnackBar("Something went wrong. Try again", isError: true);
      print(error.toString());
    }
  }

  createWorker(WorkerModel work) async {
    try {
      await _db.collection('Work').add(work.toJson());
      AppUtils.showSnackBar("Your data has been added");
    } catch (e) {
      AppUtils.showSnackBar("Error adding data", isError: true);
    }
  }

  doBooking(BookingModel booking) async {
    try {
      await _db.collection('Booking').add(booking.toJson());
      AppUtils.showSnackBar("Booking successful");
    } catch (e) {
      AppUtils.showSnackBar("Booking failed", isError: true);
    }
  }

  Future<Stream<QuerySnapshot>> getJobDetails() async {
    return _db.collection('Work').snapshots();
  }

  Future<Stream<QuerySnapshot>> getBookingDetails() async {
    return _db.collection('Booking').snapshots();
  }
}
