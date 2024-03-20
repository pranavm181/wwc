// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:table_calendar/table_calendar.dart';

// class BookingPage extends StatefulWidget {
//   const BookingPage({super.key});

//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   DateTime time = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: CupertinoPopupSurface(
//         child: Container(
//           color: const Color.fromARGB(255, 138, 232, 255),
//           width: double.infinity,
//           height: 400,
//           child: Center(
//             child: Column(
//               children: [
//                 //const BookingPage(),
//                 CupertinoButton(
//                     child: const Text('hai'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // TableCalendar(
//       //     focusedDay: time,
//       //     firstDay: DateTime.utc(2020, 10, 10),
//       //     lastDay: DateTime.utc(2030, 10, 10)),
//     );
//   }
// }
