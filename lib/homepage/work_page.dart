import 'package:flutter/material.dart';
import 'package:work_wave_connect/homepage/home_card.dart';
import 'package:work_wave_connect/homepage/home_variable.dart';
import 'package:work_wave_connect/workerspage/workers_details.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose\n        You'er worker",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(251, 6, 6, 1),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: works.length,
              itemBuilder: (context, index) {
                final work = works[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return WorkersDetails(worker: work);
                      }),
                    );
                  },
                  child: HomeCard(
                    image: work['imageUrl'] as String,
                    title: work['title'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
