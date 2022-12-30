import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Container(
              height: 800,
              width: 400,
              // ignore: prefer_const_literals_to_create_immutables
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 2, 9, 98),
                  Color.fromARGB(255, 0, 108, 174),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: Column(
                children: const [
                  Text("logo"),
                  Text(
                    "We are for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(250),
                child: Column(
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Welcome Back, Admin User',
                      style: TextStyle(
                        color: Color.fromARGB(255, 69, 30, 197),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const Text('Sign in by entering the information below'),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                          hintText: 'mail@user.com'),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.visibility),
                            labelText: 'Password',
                            hintText: 'Enter password')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forgot password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 69, 30, 197)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
