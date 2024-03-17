import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonDetails extends StatelessWidget {
  final DocumentSnapshot profileDetails;

  const PersonDetails({
    super.key,
    required this.profileDetails,
  });

  @override
  Widget build(BuildContext context) {
    const inter = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            profileDetails['name'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: (profileDetails['workerImage'] as String).isEmpty
                        ? const AssetImage('assets/images/proicon.png')
                        : AssetImage(profileDetails['workerImage'] as String),
                    height: 150,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Gender: ${profileDetails['gender'] as String}',
                          //   style: inter,
                          // ),
                          Text(
                            'Age: ${profileDetails['age'] as String}',
                            style: inter,
                          ),
                          Text(
                            'Ph NO: ${profileDetails['phno'] as String}',
                            style: inter,
                          ),
                          Text(
                            'Place: ${profileDetails['place'] as String}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: inter,
                          ),
                          Text(
                            'Email: ${profileDetails['email'] as String}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: inter,
                          ),
                          // Text(
                          //   'Year of exp: ${profileDetails['yearofexp'] as String}',
                          //   style: inter,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              ' ${profileDetails['discription'] as String}',
              style: inter,
            ),
            Text(
              'Place: ${profileDetails['place'] as String}',
              style: inter,
            ),
          ],
        ),
      ),
    );
  }
}
