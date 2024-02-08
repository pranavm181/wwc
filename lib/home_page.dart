import 'package:flutter/material.dart';
//import 'package:work_wave_connect/about_us.dart';
import 'package:work_wave_connect/profile_page.dart';
import 'package:work_wave_connect/homepage/work_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [WorkPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        iconSize: 20,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.contact_page),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_sharp,
              size: 25,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
