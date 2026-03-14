import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/features/home/about_us.dart';
import 'package:work_wave_connect/features/auth/auth_service.dart';
import 'package:work_wave_connect/features/worker/work_add_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void signOff(BuildContext context) async {
    context.read<FirebaseAuthMethods>().logout();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: AppTheme.primaryColor,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF0F172A), 
                      const Color(0xFF1E293B).withAlpha(0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.accentColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.accentColor.withAlpha(50),
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/proicon.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 50),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.email?.split('@').first ?? 'User',
                      style: const TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.email ?? 'No email',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withAlpha(180),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => signOff(context),
                icon: const Icon(Icons.logout, color: Colors.white),
              )
            ],
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                   // Stats Row
                  Row(
                    children: [
                      _buildStatCard('Bookings', '0'),
                      const SizedBox(width: 16),
                      _buildStatCard('Reviews', '0'),
                      const SizedBox(width: 16),
                      _buildStatCard('Status', 'Active'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  
                  // Menu Section
                  _buildMenuSection(context),
                  
                  const SizedBox(height: 40),
                  
                  // Version Info
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          context, 
          icon: Icons.settings_outlined, 
          title: 'Account Settings', 
          subtitle: 'Privacy, Security, Language',
          onTap: () {}
        ),
         const SizedBox(height: 16),
        _buildMenuItem(
          context, 
          icon: Icons.work_outline, 
          title: 'Worker Dashboard', 
          subtitle: 'Register or manage your services',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkAdd()));
          },
          isHighlight: true,
        ),
        const SizedBox(height: 16),
        _buildMenuItem(
          context, 
          icon: Icons.info_outline, 
          title: 'About Work Wave', 
          subtitle: 'Learn more about us',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUs()));
          }
        ),
        const SizedBox(height: 16),
        _buildMenuItem(
          context, 
          icon: Icons.headset_mic_outlined, 
          title: 'Help & Support', 
          subtitle: 'Get assistance with bookings',
          onTap: () {}
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, {
    required IconData icon, 
    required String title, 
    required String subtitle,
    required VoidCallback onTap,
    bool isHighlight = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isHighlight ? AppTheme.accentColor.withAlpha(10) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isHighlight ? Border.all(color: AppTheme.accentColor.withAlpha(50)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isHighlight ? AppTheme.accentColor : AppTheme.primaryColor.withAlpha(10),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icon, 
                    color: isHighlight ? Colors.white : AppTheme.primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
