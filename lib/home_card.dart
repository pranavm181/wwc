import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String image;
  const HomeCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 18.0, vertical: 5.0),
      child: Container(
        color: Color.fromARGB(235, 90, 211, 227),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 18.0, vertical: 18.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                height: 300,
              ),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
