import 'package:flutter/material.dart';
import 'package:work_wave_connect/core/app_theme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('About Us', style: TextStyle(color: AppTheme.primaryColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppTheme.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accentColor.withAlpha(30),
                      blurRadius: 30,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            Text(
              'Welcome to Work Wave Connect',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your trusted partner in connecting with reliable and experienced household workers. We believe that finding the right domestic help should be a seamless and stress-free experience.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.blueGrey),
            ),
            const SizedBox(height: 30),
            
            _buildSection(
              context,
              title: 'Our Mission',
              icon: Icons.flag_outlined,
              content: 'Our mission is to revolutionize the way people connect with household workers. We aim to create a platform that is both efficient and convenient, allowing employers to find the perfect match for their needs quickly and easily.',
            ),
            
            _buildSection(
              context,
              title: 'What Makes Us Unique',
              icon: Icons.star_outline, 
              content: '• Extensive Worker Profiles\n• Mobile App Convenience\n• Verified Review System\n• 24/7 Support',
            ),
            
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© 2024 Work Wave Connect',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required IconData icon, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.accentColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.accentColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(fontSize: 15, height: 1.5, color: Colors.blueGrey.shade700),
          ),
        ],
      ),
    );
  }
}
