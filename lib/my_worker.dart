import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/person_details.dart';
import 'package:work_wave_connect/workerspage/workers_detail_page_cart.dart';

class WorkerBooking extends StatefulWidget {
  const WorkerBooking({
    super.key,
  });

  @override
  State<WorkerBooking> createState() => _WorkerBookingState();
}

class _WorkerBookingState extends State<WorkerBooking> {
  Stream? jobDetails;

  getOnTheLoad() async {
    jobDetails = await DataRepository().getJobDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget showCartWork() {
    String? profileDetail;
    return StreamBuilder(
        stream: jobDetails,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot work = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            final DocumentSnapshot profileDetails =
                                snapshot.data.docs[index];
                            profileDetail = profileDetails['id'];
                            return PersonDetails(
                              profileDetails: snapshot.data.docs[index],
                            );
                          }),
                        );
                        profileDetail == work['id']
                            ? WorkerCart(
                                profile: work['workerImage'] as String,
                                yearOfExp: work['discription'] as String,
                                name: work['name'] as String,
                                place: (work['place'] as String),
                                age: (work['age'] as String),
                              )
                            : Container();
                      },
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: showCartWork());
  }
}
