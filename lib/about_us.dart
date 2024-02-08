import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    const inter = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '     Welcome to ', style: inter),
                    TextSpan(
                      text: 'Work Wave Connect',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text:
                            ', your trusted partner in connecting with reliable and experienced household workers. We believe that finding the right domestic help should be a seamless and stress-free experience.',
                        style: inter),
                    TextSpan(
                        text:
                            " That's why we've developed a user-friendly mobile app that connects employers with qualified carpenter, electrician, plumbers, and other household professionals.",
                        style: inter),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Our Mission",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '     Our mission is to revolutionize the way people connect with household workers. We aim to create a platform that is both efficient and convenient, allowing employers to find the perfect match for their needs quickly and easily. We also want to ensure that our workers are treated with respect and value, and that they have the opportunity to build rewarding careers in the household services industry.',
                style: inter,
              ),
              SizedBox(height: 10),
              Text(
                "What Makes Us Unique",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                  '             WORK WAVE CONNECT stands out from other household worker platforms for several reasons:',
                  style: inter),
              SizedBox(
                height: 5,
              ),
              Text(
                  '             Extensive Worker Profiles Each of our workers has a comprehensive profile that includes their experience, skills, qualifications, and availability. This allows you to easily find the right person for the job based on your specific needs.',
                  style: inter),
              SizedBox(height: 10),
              Text(
                "Mobile App Convenience",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                  '            Our app is designed to make it easy for you to manage your household needs on the go. You can search for workers, send messages, schedule appointments, and track your expenses all from your smartphone or tablet',
                  style: inter),
              SizedBox(height: 5),
              Text(
                "Review System",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                  '            We encourage employers to leave reviews for our workers, which helps to ensure that only the best and most reliable individuals are represented on our platform.',
                  style: inter),
              SizedBox(height: 10),
              Text(
                "24/7 Support",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                  '           Our customer support team is available 24/7 to help you with any questions or concerns you may have.',
                  style: inter),
              SizedBox(height: 10),
              Text(
                "Join Us Today!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                  '             We invite you to download the WORK WAVE CONNECT app and experience the difference for yourself. With our extensive network of qualified workers, convenient mobile app, and commitment to providing the best possible service, we are confident that we can help you find the perfect match for your household needs.',
                  style: inter),
            ],
          ),
        ),
      ),
    );
  }
}
