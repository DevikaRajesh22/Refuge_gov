import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 300,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Stats',
                                            style: GoogleFonts.inriaSans(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                  255, 3, 4, 94),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          RefugeBreakdownItem(
                                            icons: Icons.rocket_launch,
                                            label: '509',
                                            text: 'Active NGOs',
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          RefugeBreakdownItem(
                                            icons: Icons.query_stats,
                                            label: 'Rs 2.56Cr',
                                            text: 'Total donations',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          RefugeBreakdownItem(
                                            icons: Icons.money_rounded,
                                            label: 'Rs 1.76Cr',
                                            text: 'Total expenses',
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          RefugeBreakdownItem(
                                            icons: Icons.people,
                                            label: '1.3 Lakhs',
                                            text: 'Total refugees',
                                          ),
                                        ],
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
                              height: 300,
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
                                        children: [
                                          Text(
                                            'History',
                                            style: GoogleFonts.inriaSans(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                  255, 3, 4, 94),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/bar.png',
                                            height: 240,
                                            width: 350,
                                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 300,
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
                                        children: [
                                          Text(
                                            'Updates',
                                            style: GoogleFonts.inriaSans(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                  255, 3, 4, 94),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/news1.png',
                                                height: 70,
                                                width: 110,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Russia Ukraine War LIVE Updates:\n Russian election officials say\n early results show Ukraine\n regions strongly annexation',
                                                style: GoogleFonts.inriaSans(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/news2.png',
                                                height: 70,
                                                width: 110,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '55 Sikh, Hindu refugees from\n afganistan reach Delhi',
                                                style: GoogleFonts.inriaSans(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/news3.png',
                                                height: 70,
                                                width: 110,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Over 40,000 refugees from\n Myanmar based in 60 camps\n set up in mizoram, says Rajya\n Sabha MP',
                                                style: GoogleFonts.inriaSans(
                                                  fontSize: 14,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 300,
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
                                        children: [
                                          Text(
                                            'Revenue Breakdown',
                                            style: GoogleFonts.inriaSans(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                  255, 3, 4, 94),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/revenue.png',
                                            height: 200,
                                            width: 250,
                                          ),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RefugeBreakdownItem extends StatelessWidget {
  final String label, text;
  final IconData icons;
  const RefugeBreakdownItem({
    super.key,
    required this.label,
    required this.text,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          size: 30,
          color: const Color.fromARGB(255, 3, 4, 94),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 3, 4, 94),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 3, 4, 94),
          ),
        ),
      ],
    );
  }
}
