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
                color: const Color.fromARGB(255, 0, 119, 182),
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
                  height: 550,
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
                            height: 150,
                            width: 400,
                            color: const Color.fromARGB(200, 146, 197, 224),
                            child: Text(
                              'Founding year : 2010\nOwnership: Name\nTotal volunteers: 67\nTransport vehicles: 18\nFood Services: Yes\nAddress: xyz Building place pin',
                              style: GoogleFonts.inriaSans(
                                fontSize: 15,
                              ),
                            ),
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
                  height: 550,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: const [
                              //type
                            ],
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
