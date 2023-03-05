import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_govt/ui/screens/home.dart';

import '../../widgets/custom_button.dart';

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
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 119, 182),
                    Color.fromARGB(255, 3, 4, 94),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 744,
                    width: 400,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 119, 182),
                          Color.fromARGB(255, 3, 4, 94),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 90,
                          width: 90,
                        ),
                        //image
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "REFUGE",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inriaSerif(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(
                          height: 225,
                        ),
                        Text(
                          "We are for you",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inriaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 340,
                          child: Text(
                            'No matter where you are, you deserve love, respect, and kindness. And we make sure you receive our best services...',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inriaSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                              LineIcons.twitter,
                              color: Color.fromARGB(220, 255, 255, 255),
                              size: 30,
                            ),
                            Icon(
                              LineIcons.linkedinIn,
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
                          children: [
                            Text(
                              'Privacy policy',
                              style: GoogleFonts.inriaSans(
                                fontSize: 13,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              'Contact',
                              style: GoogleFonts.inriaSans(
                                fontSize: 13,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              '@2023 refuge',
                              style: GoogleFonts.inriaSans(
                                fontSize: 13,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
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
                      Text(
                        textAlign: TextAlign.center,
                        'Welcome Back, Admin User',
                        style: GoogleFonts.inriaSans(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 69, 30, 197),
                        ),
                      ),
                      Text(
                        'Sign in by entering the information below',
                        style: GoogleFonts.inriaSans(
                          fontSize: 17,
                          color: const Color.fromARGB(200, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                          hintText: 'mail@user.com',
                        ),
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
                            hintText: 'Enter password'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password?",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inriaSans(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 69, 30, 197),
                            ),
                          ),
                        ], //row children
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                label: "Login",
                                buttonColor:
                                    const Color.fromARGB(255, 21, 23, 146),
                                labelColor: Colors.white,
                                elevation: 5,
                                onPressed: (() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                }),
                              )
                            ],
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
