import 'package:flutter/material.dart';
import 'package:work_wave_connect/home_page.dart';
import 'package:work_wave_connect/workerspage/workers_detail_page_cart.dart';

class PersonDetails extends StatelessWidget {
  final Map<String, Object> workersdata;
  const PersonDetails({
    super.key,
    required this.workersdata,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Expanded(
          child: ListView.builder(
            itemCount: workersdata.length,
            itemBuilder: (context, index) {
              final work = workersdata[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                },
                child: workersdata['id'] == 1 ? const HomePage() : Container(),
              );
            },
          ),
        ));
  }
}
