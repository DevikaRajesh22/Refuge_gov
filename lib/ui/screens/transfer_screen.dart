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
                        height: 100,
                      ),
                      SizedBox(
                        width: 650,
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
                                    Image.asset(
                                      'assets/images/people1.png',
                                      height: 50,
                                      width: 50,
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
                                          'Sai Andaman Nicobar Motivation And Education trust',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          ' Near Junglighat Govt. School, \nJunglighat, Port Blair- 744103',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      '10k',
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 3, 4, 85),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 650,
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
                                    Image.asset(
                                      'assets/images/people2.png',
                                      height: 50,
                                      width: 50,
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
                                          'Steps aid india',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'austinabad brichgunj P. O port Blair south Andaman india - Pin - 744 103',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      '-12k',
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 3, 4, 85),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 650,
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
                                    Image.asset(
                                      'assets/images/people3.png',
                                      height: 50,
                                      width: 50,
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
                                          'Island Development Organization',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          'Santhayalay Building, 1st Floor, Lillypur, Haddo,port Blair',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Text(
                                      '1k',
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 3, 4, 85),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 650,
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
                                    Image.asset(
                                      'assets/images/people4.png',
                                      height: 50,
                                      width: 50,
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
                                          'Snahalaya Ashram',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          ' Pankaj Deep Bhawan , Vip Road, Port Blair',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 250,
                                    ),
                                    Text(
                                      '-2k',
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 3, 4, 85),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 650,
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
                                    Image.asset(
                                      'assets/images/people5.png',
                                      height: 50,
                                      width: 50,
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
                                          'Capstone Ministries',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                        Text(
                                          ' H. No. 1665, Ward No 23 bird Line',
                                          style: GoogleFonts.inriaSans(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 3, 4, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 290,
                                    ),
                                    Text(
                                      '-9k',
                                      style: GoogleFonts.inriaSans(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 3, 4, 85),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
