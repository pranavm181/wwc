import 'package:flutter/material.dart';

class WorkerCart extends StatelessWidget {
  final String discription;
  final String name;
  final String profile;
  const WorkerCart({
    super.key,
    required this.discription,
    required this.profile,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 18.0, vertical: 5.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 18.0, vertical: 18.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: profile.isEmpty
                            ? const AssetImage('assets/images/proicon.png')
                            : AssetImage(profile),
                        height: 85,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            discription,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall,
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
