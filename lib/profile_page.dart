import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/about_us.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/work_add_page.dart';
import 'package:work_wave_connect/worker_signup.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void signOff() async {
    FirebaseAuthMethods(FirebaseAuth.instance).logout();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: const Color.fromARGB(124, 151, 191, 224).withOpacity(0.2),
    );
    const styleOfButton = TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );
    // final usrName = FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(user.uid)
    //     .collection('user');
    // final querySnapshot=await
    // final  doc = usrName.docs.first;

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
                        image: AssetImage('assets/images/proicon.png'),
                      ),
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
                Column(
                  children: [
                    Text(
                      user.uid,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.email as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                decoration: decoration,
                child: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text(
                "Settings",
                style: styleOfButton,
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
                decoration: decoration,
                child: const Icon(
                  Icons.groups,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text("About US", style: styleOfButton),
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
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: decoration,
                child: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 0, 0, 11),
                ),
              ),
              title: const Text("Register as a Worker", style: styleOfButton),
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
                        return const WorkAdd();
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
                decoration: decoration,
                child: IconButton(
                  onPressed: signOff,
                  icon: const Icon(Icons.logout),
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
