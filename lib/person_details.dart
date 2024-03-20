// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:work_wave_connect/booking_module.dart';
import 'package:work_wave_connect/signup_controller.dart';

class PersonDetails extends StatefulWidget {
  final DocumentSnapshot profileDetails;

  const PersonDetails({
    super.key,
    required this.profileDetails,
  });

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    String bookedDate;
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
                    image:
                        (widget.profileDetails['workerImage'] as String).isEmpty
                            ? const AssetImage('assets/images/proicon.png')
                            : AssetImage(
                                widget.profileDetails['workerImage'] as String),
                    height: 120,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    ' ${widget.profileDetails['name'] as String}',
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
                          launch(
                              'tel:+91${widget.profileDetails['phno'] as String}');
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
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext builder) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return CupertinoPopupSurface(
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 138, 232, 255),
                                      width: double.infinity,
                                      height: 400,
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'Book your slot',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              ),
                                            ),
                                            ElevatedButton(
                                              child: Text(
                                                "Select Date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              ),
                                              onPressed: () async {
                                                final DateTime? dateTime =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: selectedDate,
                                                  firstDate: DateTime(2020),
                                                  lastDate: DateTime(2030),
                                                );
                                                if (dateTime != null) {
                                                  setState(() {
                                                    selectedDate = dateTime;
                                                  });
                                                }
                                              },
                                            ),
                                            Text(
                                              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            ElevatedButton(
                                              child: Text(
                                                "Select Time",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              ),
                                              onPressed: () async {
                                                final TimeOfDay? timeOfDay =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            selectedTime,
                                                        initialEntryMode:
                                                            TimePickerEntryMode
                                                                .dial);
                                                if (timeOfDay != null) {
                                                  setState(() {
                                                    selectedTime = timeOfDay;
                                                  });
                                                }
                                              },
                                            ),
                                            Text(
                                              "${selectedTime.hour}:${selectedTime.minute}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  final booking = BookingModel(
                                                      id: widget
                                                          .profileDetails['id'],
                                                      time:
                                                          "${selectedTime.hour}:${selectedTime.minute}",
                                                      date:
                                                          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                                                      context: context);
                                                  SignUpController()
                                                      .addBooking(booking);
                                                      Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Book',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
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
                        ' ${widget.profileDetails['age'] as String}',
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
                        ' ${widget.profileDetails['Gender'] as String}',
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
                        ' ${widget.profileDetails['yearofexp'] as String}',
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
                        ' ${widget.profileDetails['place'] as String}',
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
                        ' ${widget.profileDetails['email'] as String}',
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
                        ' ${widget.profileDetails['phno'] as String}',
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
                        ' ${widget.profileDetails['discription'] as String}',
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
