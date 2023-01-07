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
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Welcome back, Admin',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 3, 4, 94),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.waving_hand_sharp,
                            color: Color.fromARGB(255, 249, 224, 0),
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 700,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.search_rounded,
                            color: Color.fromARGB(255, 3, 4, 94),
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 3, 4, 94),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //type column items
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
