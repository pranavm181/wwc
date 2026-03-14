import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/data/models/user_model.dart';
import 'package:work_wave_connect/features/auth/login_page.dart';
import 'package:work_wave_connect/features/auth/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool passshow = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      context: context,
    );
    context.read<SignUpController>().registerUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('CREATE ACCOUNT'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              // Header Image
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withAlpha(25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person_add_outlined, size: 50, color: AppTheme.accentColor),
                ),
              ),
              const SizedBox(height: 20),
              
              Text(
                'Let\'s Get Started!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Create an account to access all features',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),
              
              // Form Fields
              _buildModernTextField(
                controller: nameController,
                label: 'Full Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildModernTextField(
                controller: emailController,
                label: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              _buildModernTextField(
                controller: phoneController,
                label: 'Phone Number',
                icon: Icons.phone_android_outlined,
              ),
              const SizedBox(height: 16),
              _buildModernTextField(
                controller: passwordController,
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              
              const SizedBox(height: 40),
              
              ElevatedButton(
                onPressed: signUpUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shadowColor: AppTheme.accentColor.withAlpha(80),
                  elevation: 10,
                ),
                child: const Text('REGISTER USER'),
              ),
              
              const SizedBox(height: 30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already hav an account? '),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: AppTheme.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && passshow,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: false,
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueGrey.shade400, fontWeight: FontWeight.normal),
          suffixIcon: isPassword
            ? IconButton(
                icon: Icon(passshow ? Icons.visibility_off : Icons.visibility, color: Colors.blueGrey),
                onPressed: () => setState(() => passshow = !passshow),
              )
            : null,
        ),
      ),
    );
  }
}
