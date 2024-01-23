import 'dart:io';

import 'package:flutter/material.dart';
import 'package:work_wave_connect/person_details.dart';
import 'package:work_wave_connect/workers_page_cart.dart';
import 'package:work_wave_connect/workers_data.dart';

class WorkersDetails extends StatelessWidget {
  final Map<String, Object> worker;
  const WorkersDetails({
    super.key,
    required this.worker,
  });

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
                  Text(worker['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workersdata.length,
              itemBuilder: (context, index) {
                final work = workersdata[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const PersonDetails();
                      }),
                    );
                  },
                  child: worker['title'] == work['title']
                      ? WorkerCart(
                          profile: work['imageUrl'] as String,
                          discription: work['discription'] as String,
                          name: work['name'] as String,
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
