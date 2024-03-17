import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/person_details.dart';

import 'package:work_wave_connect/signup_controller.dart';
import 'package:work_wave_connect/work_add_page.dart';
import 'package:work_wave_connect/worker_model.dart';

enum Gender { male, female, other }

class WorkerSignup extends StatefulWidget {
  const WorkerSignup({super.key});

  @override
  State<WorkerSignup> createState() => _WorkerSignupState();
}

class _WorkerSignupState extends State<WorkerSignup> {
  String? selectedvalue;
  final workersList = [
    '--Select--',
    'Electrician\'s',
    'Carpenter\'s',
    'Plumber\'s',
    'Cleaner\'s'
  ];

  @override
  Widget build(BuildContext context) {
    Gender? gender;
    final size = MediaQuery.of(context).size;

    final controller = SignUpController();
    final user = FirebaseAuthMethods(FirebaseAuth.instance).user;

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
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedvalue,
                          items: workersList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedvalue = val;
                            });
                          },
                          icon: const Icon(
                            Icons.expand_circle_down,
                            color: Colors.grey,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Worker Type",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person),
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: controller.name,
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
                        controller: controller.phone,
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
                        controller: controller.age,
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
                        controller: controller.place,
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
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<Gender>(
                                contentPadding: const EdgeInsets.all(0.0),
                                value: Gender.male,
                                groupValue: gender,
                                title: Text(Gender.male.name),
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                    // ignore: avoid_print
                                    print(val);
                                  });
                                }),
                          ),
                          // Expanded(
                          //   child: RadioListTile<Gender>(
                          //       contentPadding: const EdgeInsets.all(0.0),
                          //       value: Gender.female,
                          //       groupValue: gender,
                          //       title: Text(Gender.female.name),
                          //       onChanged: (val) {
                          //         setState(() {
                          //           gender = val;
                          //           // ignore: avoid_print
                          //           print(val);
                          //         });
                          //       }),
                          // ),
                        ],
                      ),

                      const SizedBox(height: 5),
                      TextFormField(
                        controller: controller.discription,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          label: Text('Description'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.description_outlined),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Expanded(
                      //         child: ListTile(
                      //           title: const Text('male'),
                      //           leading: Radio(
                      //               value: 'male',
                      //               groupValue: null,
                      //               onChanged: (value) {}),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: ListTile(
                      //           title: const Text('female'),
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
                            onPressed: () {
                              final work = WorkerModel(
                                name: controller.name.text,
                                email: user.email.toString(),
                                phone: controller.phone.text,
                                img: "",
                                work: selectedvalue,
                                age: controller.age.text,
                                // gender: gender,
                                discription: controller.discription.text,
                                place: controller.place.text,
                                context: context,
                              );
                              SignUpController().addWork(work);
                              Navigator.pop(context);
                            },
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
