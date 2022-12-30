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
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 56, 69, 184),
                  Color.fromARGB(95, 45, 58, 227),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: const Text("logo"),
            ),
            Expanded(
              child: Column(
                children: const [
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome Back, Admin User',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 30, 197),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  Text('Sign in by entering the information below'),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        hintText: 'mail@user.com'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter password')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
