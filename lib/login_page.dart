import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: 'Email',
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint_outlined),
                            labelText: 'Password',
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: null, icon: Icon(Icons.visibility)),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text('Forget Password?')),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
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
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          text: "Don't Have an Account?",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const [
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                color: Colors.purple,
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
