import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/signup_controller.dart';
import 'package:work_wave_connect/signup_page.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login-email-password';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = SignUpController();
  @override
  void dispose() {
    super.dispose();
    controller.email.dispose();
    controller.password.dispose();
  }

  void login() async {
    context.read<SignUpController>().loginUser(
          controller.email.text,
          controller.password.text,
          context,
        );
  }

  bool passshow = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage('assets/images/logo.jpg'),
                  height: size.height * 0.3,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password,
                          obscureText: passshow,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.key_rounded,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                            floatingLabelStyle:
                                const TextStyle(color: Colors.black),
                            hintText: 'Password',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passshow ? passshow = false : passshow = true;
                                });
                              },
                              icon: Icon(passshow == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(color: Colors.lightBlueAccent),
                              )),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('OR'),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(
                          image: AssetImage('assets/images/th.jpeg'),
                          width: 30.0,
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Sign-In With Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignupScreen();
                        }));
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't Have an Account?",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const [
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
