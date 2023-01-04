import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                children: [
                  Container(
                    height: 744,
                    width: 400,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 108, 174),
                          Color.fromARGB(255, 2, 9, 98),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "REFUGE",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(220, 255, 255, 255),
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 225,
                        ),
                        const Text(
                          "We are for you",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(220, 255, 255, 255),
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 340,
                          child: Text(
                            'No matter where you are, you deserve love, respect, and kindness. And we make sure you receive our best services...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(220, 255, 255, 255),
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 15,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: const [
                            Icon(
                              Icons.facebook_rounded,
                              color: Color.fromARGB(220, 255, 255, 255),
                              size: 30,
                            ),
                            Icon(
                              Icons.facebook_rounded,
                              color: Color.fromARGB(220, 255, 255, 255),
                              size: 30,
                            ),
                            Icon(
                              Icons.facebook_rounded,
                              color: Color.fromARGB(220, 255, 255, 255),
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 15,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: const [
                            Text(
                              'Privacy policy',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(220, 255, 255, 255)),
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(220, 255, 255, 255)),
                            ),
                            Text(
                              '@2023 refuge',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(220, 255, 255, 255)),
                            ),
                          ], //children
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Center(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const Text(
                        'Sign in by entering the information below',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            hintText: 'mail@user.com'),
                      ),
                      const SizedBox(
                        height: 10,
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
                        ], //row children
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: Material(
                          elevation: 4,
                          color: const Color.fromARGB(255, 2, 56, 134),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 5, 27, 70),
                              width: 0.0001,
                            ),
                          ),
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Update'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
