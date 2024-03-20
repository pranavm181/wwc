// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class PersonDetails extends StatelessWidget {
  final DocumentSnapshot profileDetails;

  const PersonDetails({
    super.key,
    required this.profileDetails,
  });

  @override
  Widget build(BuildContext context) {
    // const inter = TextStyle(
    //   fontFamily: 'Inter',
    //   fontWeight: FontWeight.bold,
    //   fontSize: 18,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Worker profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Image(
                    image: (profileDetails['workerImage'] as String).isEmpty
                        ? const AssetImage('assets/images/proicon.png')
                        : AssetImage(profileDetails['workerImage'] as String),
                    height: 120,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    ' ${profileDetails['name'] as String}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          launch('tel:+91${profileDetails['phno'] as String}');
                        },
                        label: const Text(
                          'Phone',
                          style: TextStyle(color: Colors.black),
                        ),
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.lightBlueAccent),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text(
                          'Email',
                          style: TextStyle(color: Colors.black),
                        ),
                        icon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.lightBlueAccent),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text(
                          'Add',
                          style: TextStyle(color: Colors.black),
                        ),
                        icon: const Icon(
                          Icons.person_add,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.lightBlueAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Age:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['age'] as String}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Gender:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['Gender'] as String}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Year Of Exp:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['yearofexp'] as String}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Place:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['place'] as String}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Email:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['email'] as String}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Phone No:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['phno'] as String}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                    const Text(
                      'Description:',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ' ${profileDetails['discription'] as String}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'inter'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
