import 'package:flutter/material.dart';

import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/my_worker1.dart';

class WorkerBooking extends StatefulWidget {
  const WorkerBooking({
    super.key,
  });

  @override
  State<WorkerBooking> createState() => _WorkerBookingState();
}

class _WorkerBookingState extends State<WorkerBooking> {
  Stream? bookingDetails;

  getOnTheLoad() async {
    bookingDetails = await DataRepository().getBookingDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget bookingDetail() {
    return StreamBuilder(
        stream: bookingDetails,
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                //final DocumentSnapshot booking = snapshot.data.docs[index];
                return WorkerBooking1(booking: snapshot.data.docs[index]);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bookings'),
      ),
      body: bookingDetail(),
    );
  }
}
