import 'package:flutter/material.dart';
import 'package:work_wave_connect/home_variable.dart';
import 'package:work_wave_connect/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Choose\n        You'er worker",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(251, 6, 6, 1),
                            ),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50)))),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: works.length,
              itemBuilder: (context, index) {
                final work = works[index];
                return HomeCard(
                  image: work['imageUrl'] as String,
                  title: work['title'] as String,
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
