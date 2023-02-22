import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 600,
                        child: Material(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_rounded,
                                      color: Color.fromARGB(255, 29, 100, 244),
                                      size: 70,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Topic: Go ahead, Dream about the future',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'By: Charlie Jane Anders',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Location: Camp 45',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Date: January 29 2023',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Time: 11:00 am to 12:30 pm',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 600,
                        child: Material(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_rounded,
                                      color: Color.fromARGB(255, 29, 100, 244),
                                      size: 70,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Topic: The art of stillness',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'By: Pico Iyer',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Date: January 25 2023',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Location: Camp 32',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Time: 11:30 am to 1:00 pm',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 600,
                        child: Material(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_rounded,
                                      color: Color.fromARGB(255, 29, 100, 244),
                                      size: 70,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Topic: Empathy is not endorsement',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'By: Dylan Marron',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Date: January 20 2023',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Location: Camp 21',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Time: 10:00 am to 11:30 pm',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 600,
                        child: Material(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_rounded,
                                      color: Color.fromARGB(255, 29, 100, 244),
                                      size: 70,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Topic: The war in Ukraine could change everything',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'By:  Yuval Noah Harari',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Date: January 15 2023',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Location: Camp 12',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Time: 11:00 am to 12:30 pm',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
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
