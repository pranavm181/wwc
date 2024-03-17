import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/person_details.dart';
import 'package:work_wave_connect/worker_signup.dart';
import 'package:work_wave_connect/workerspage/workers_data.dart';
import 'package:work_wave_connect/workerspage/workers_detail_page_cart.dart';

class WorkAdd extends StatefulWidget {
  const WorkAdd({super.key});

  @override
  State<WorkAdd> createState() => _WorkAddState();
}

class _WorkAddState extends State<WorkAdd> {
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

  Widget addMyWork() {
    final user = context.read<FirebaseAuthMethods>().user;
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
                            return PersonDetails(
                              profileDetails: snapshot.data.docs[index],
                            );
                          }),
                        );
                      },
                      child: user.email == work['email']
                          ? WorkerCart(
                              profile: work['workerImage'] as String,
                              discription: work['discription'] as String,
                              name: work['name'] as String,
                              place: (work['place'] as String),
                              age: (work['age'] as String),
                            )
                          : Container(),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkerSignup(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Your jobs'),
      ),
      body: addMyWork(),
    );
  }
}
