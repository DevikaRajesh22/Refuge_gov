import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 800,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Icon(
                      Icons.account_circle_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 85,
                    ),
                    const Text(
                      'ADMIN',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.home_sharp,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_chart,
                              color: Color.fromARGB(190, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Statistics',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.people_rounded,
                              color: Color.fromARGB(190, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'NGOs',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.attach_money_rounded,
                              color: Color.fromARGB(190, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Finance',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: Color.fromARGB(190, 255, 255, 255),
                                  size: 15,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(190, 255, 255, 255),
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Transfer',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(190, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Calendar',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(190, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.logout_sharp,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //column container
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          SizedBox(
                            width: 160,
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Search',
                                suffixIcon: Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.dashboard_rounded,
                              color: Color.fromARGB(255, 29, 100, 244),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.notifications,
                              color: Color.fromARGB(255, 29, 100, 244),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Color.fromARGB(255, 29, 100, 244),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 100,
                        width: 600,
                        color: const Color.fromARGB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 70,
                                color: Color.fromARGB(255, 3, 4, 85),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Topic: Go ahead, Dream about the future',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'By: Charlie Jane Anders',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Location: Camp 45',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Date: January 29 2023',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Time: 11:00 am to 12:30 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 600,
                        color: const Color.fromARGB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 70,
                                color: Color.fromARGB(255, 3, 4, 85),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Topic: The art of stillness',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'By: Pico Iyer',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Date: January 25 2023',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Location: Camp 32',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Time: 11:30 am to 1:00 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 600,
                        color: const Color.fromARGB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 70,
                                color: Color.fromARGB(255, 3, 4, 85),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Topic: Empathy is not endorsement',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'By: Dylan Marron',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Date: January 20 2023',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Location: Camp 21',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Time: 10:00 am to 11:30 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 600,
                        color: const Color.fromARGB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 70,
                                color: Color.fromARGB(255, 3, 4, 85),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Topic: The war in Ukraine could change everything',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'By:  Yuval Noah Harari',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Date: January 15 2023',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Location: Camp 12',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                                Text(
                                  'Time: 11:00 am to 12:30 pm',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 3, 4, 85),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 300,
                        child: Material(
                          elevation: 4,
                          color: const Color.fromARGB(255, 84, 133, 234),
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
                                Text('Add'),
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
