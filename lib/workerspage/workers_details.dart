import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/person_details.dart';
import 'package:work_wave_connect/workerspage/workers_detail_page_cart.dart';

class WorkersDetails extends StatefulWidget {
  final Map<String, Object> worker;
  const WorkersDetails({
    super.key,
    required this.worker,
  });

  @override
  State<WorkersDetails> createState() => _WorkersDetailsState();
}

class _WorkersDetailsState extends State<WorkersDetails> {
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

  Widget allWorkData() {
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
                      child: widget.worker['title'] == work['work']
                          ? WorkerCart(
                              profile: work['workerImage'] as String,
                              yearOfExp: work['discription'] as String,
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
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(widget.worker['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
          Expanded(
            child: allWorkData(),
          ),
        ],
      ),
    );
  }
}
