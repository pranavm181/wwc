import 'package:flutter/material.dart';

class WorkerCart extends StatelessWidget {
  final String yearOfExp;
  final String place;
  final String name;
  final String profile;
  final String age;
  const WorkerCart({
    super.key,
    required this.yearOfExp,
    required this.profile,
    required this.name,
    required this.place,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    const inter = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20.0, vertical: 5.0),
      child: Card(
        color: const Color.fromARGB(255, 138, 232, 255),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 18.0, vertical: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: profile.isEmpty
                        ? const AssetImage('assets/images/proicon.png')
                        : AssetImage(profile),
                    height: 70,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' $name',
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'inter',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Age: $age',
                            style: inter,
                          ),
                          Text(
                            yearOfExp,
                            style: inter,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Place: $place',
                            style: inter,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
