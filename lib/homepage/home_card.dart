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
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Card(
          color: const Color.fromARGB(255, 138, 232, 255),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    image,
                  ),
                  height: 140,
                ),
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
