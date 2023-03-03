import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 500,
                color: const Color.fromARGB(255, 2, 9, 98),
                child: Text(
                  'New',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inriaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 40,
                width: 500,
                color: const Color.fromARGB(80, 0, 0, 0),
                child: Text(
                  'Existing',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inriaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 500,
                  width: 500,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/people1.png',
                                height: 70,
                                width: 70,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Capstone Ministries',
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 3, 4, 94),
                                    ),
                                  ),
                                  Text(
                                    'We care about people..',
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 15,
                                      color:
                                          const Color.fromARGB(255, 3, 4, 94),
                                    ),
                                  ),
                                  Text(
                                    'Requested 10 minutes ago...',
                                    style: GoogleFonts.inriaSans(
                                        fontSize: 13,
                                        color:
                                            const Color.fromARGB(150, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 200,
                            width: 400,
                            color: const Color.fromARGB(200, 146, 197, 224),
                            child: Text(
                              '\n  Founding year : 2010\n  Ownership: Name\n  Total volunteers: 67\n  Transport vehicles: 18\n  Food Services: Yes\n  Address: xyz Building place pin',
                              style: GoogleFonts.inriaSans(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 3, 4, 94)),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Accept',
                                style: GoogleFonts.inriaSans(
                                  color: const Color.fromARGB(255, 3, 4, 94),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Text(
                                'Reject',
                                style: GoogleFonts.inriaSans(
                                  color: const Color.fromARGB(180, 3, 4, 94),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 500,
                  width: 500,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/people3.png',
                                height: 70,
                                width: 70,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Island Development Organization',
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 3, 4, 94),
                                    ),
                                  ),
                                  Text(
                                    'Made for the people',
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 15,
                                      color:
                                          const Color.fromARGB(255, 3, 4, 94),
                                    ),
                                  ),
                                  Text(
                                    'Requested 15 minutes ago...',
                                    style: GoogleFonts.inriaSans(
                                        fontSize: 13,
                                        color:
                                            const Color.fromARGB(150, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 200,
                            width: 400,
                            color: const Color.fromARGB(200, 146, 197, 224),
                            child: Text(
                              '\n  Founding year : 2009\n  Ownership: Name\n  Total volunteers: 89\n  Transport vehicles: 16\n  Food Services: Yes\n  Shelter facilities: Yes\n  Addrerss: abc building place pin',
                              style: GoogleFonts.inriaSans(
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 3, 4, 94)),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Accept',
                                style: GoogleFonts.inriaSans(
                                  color: const Color.fromARGB(255, 3, 4, 94),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Text(
                                'Reject',
                                style: GoogleFonts.inriaSans(
                                  color: const Color.fromARGB(180, 3, 4, 94),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
