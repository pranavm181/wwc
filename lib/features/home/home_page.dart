import 'package:flutter/material.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/features/home/profile_page.dart';
import 'package:work_wave_connect/homepage/work_page.dart';
import 'package:work_wave_connect/features/worker/my_worker1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  
  final List<Widget> pages = const [
    WorkerBooking1(), 
    WorkPage(), 
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Crucial for floating nav bar
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withAlpha(80),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: AppTheme.accentColor.withAlpha(50),
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              iconTheme: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const IconThemeData(color: AppTheme.accentColor);
                }
                return const IconThemeData(color: Colors.white54);
              }),
            ),
            child: NavigationBar(
              height: 70,
              backgroundColor: Colors.transparent,
              selectedIndex: currentPage,
              onDestinationSelected: (index) => setState(() => currentPage = index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  selectedIcon: Icon(Icons.calendar_month),
                  label: 'Bookings',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Discover',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
