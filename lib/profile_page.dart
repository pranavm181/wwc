import 'package:flutter/material.dart';
import 'package:work_wave_connect/about_us.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/proicon.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                      child:
                          const Icon(Icons.edit, color: Colors.black, size: 20),
                    ),
                  ),
                ]),
                const Column(
                  children: [
                    Text(
                      "      User's name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email ID",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      const Color.fromARGB(124, 151, 191, 224).withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(124, 151, 191, 224)
                        .withOpacity(0.2)),
                child: const Icon(
                  Icons.arrow_right,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      const Color.fromARGB(124, 151, 191, 224).withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.groups,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text(
                "About US",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(124, 151, 191, 224)
                          .withOpacity(0.2)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AboutUs();
                      }));
                    },
                    icon: const Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      const Color.fromARGB(124, 151, 191, 224).withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ),
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(124, 151, 191, 224)
                        .withOpacity(0.2)),
                child: const Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
