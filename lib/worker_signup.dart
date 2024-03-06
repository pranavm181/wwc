// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Gender { Male, Female }

class WorkerSignup extends StatefulWidget {
  const WorkerSignup({super.key});

  @override
  State<WorkerSignup> createState() => _WorkerSignupState();
}

class _WorkerSignupState extends State<WorkerSignup> {
  @override
  Widget build(BuildContext context) {
    Gender? gender;
    final size = MediaQuery.of(context).size;
    final workersList = ["Electrician", "Carpenter", "Plumber", "Cleaner"];
    String? selectedvalue = workersList[0];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: const AssetImage('assets/images/logo.jpg'),
                height: size.height * 0.3,
              ),
              Text(
                "Start Your Journey as a HouseHold Worker Today",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField(
                        value: selectedvalue,
                        items: workersList.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (val) {
                          setState(() {
                            selectedvalue = val as String;
                          });
                        },
                        icon: const Icon(
                          Icons.expand_circle_down,
                          color: Colors.grey,
                        ),
                        decoration: const InputDecoration(
                            labelText: "Worker Type",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.black))),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Full Name'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Phone No.'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Age'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Place'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.my_location),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<Gender>(
                                contentPadding: const EdgeInsets.all(0.0),
                                value: Gender.Male,
                                groupValue: gender,
                                title: Text(Gender.Male.name),
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile<Gender>(
                                contentPadding: const EdgeInsets.all(0.0),
                                value: Gender.Female,
                                groupValue: gender,
                                title: Text(Gender.Female.name),
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                        ],
                      ),

                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Expanded(
                      //         child: ListTile(
                      //           title: const Text('Male'),
                      //           leading: Radio(
                      //               value: 'male',
                      //               groupValue: null,
                      //               onChanged: (value) {}),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: ListTile(
                      //           title: const Text('Female'),
                      //           leading: Radio(
                      //               value: 'female',
                      //               groupValue: null,
                      //               onChanged: (value) {}),
                      //         ),
                      //       ),
                      //     ]),

                      // Expanded(
                      //   child: ListTile(
                      //     title: const Text('Other'),
                      //     leading: Radio(
                      //         value: 'other',
                      //         groupValue: null,
                      //         onChanged: (value) {}),
                      //   ),
                      // ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.black),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
