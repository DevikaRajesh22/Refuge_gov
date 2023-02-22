import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_govt/ui/screens/calendar_screen.dart';
import 'package:refuge_govt/ui/screens/dashboard_screen.dart';
import 'package:refuge_govt/ui/screens/finance_screen.dart';
import 'package:refuge_govt/ui/screens/ngo_screen.dart';
import 'package:refuge_govt/ui/screens/statistics_screen.dart';
import 'package:refuge_govt/ui/screens/transfer_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.dashboard_rounded,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DashboardScreen(),
          StatisticsScreen(),
          NgoScreen(),
          FinanceScreen(),
          TransferScreen(),
          CalenderScreen(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Text(
                'REFUGE',
                style: GoogleFonts.inriaSerif(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              DrawerItem(
                icon: Icons.dashboard_sharp,
                label: 'Dashboard',
                onTap: () {
                  _tabController!.animateTo(0);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 0,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.query_stats,
                label: 'Statistics',
                onTap: () {
                  _tabController!.animateTo(1);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 1,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.people_outline,
                label: 'NGO',
                onTap: () {
                  _tabController!.animateTo(2);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 2,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.money_sharp,
                label: 'Finance',
                onTap: () {
                  _tabController!.animateTo(3);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 3,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.arrow_back,
                label: 'Transfer',
                onTap: () {
                  _tabController!.animateTo(4);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 4,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.calendar_month,
                label: 'Calendar',
                onTap: () {
                  _tabController!.animateTo(5);
                  setState(() {});
                  Navigator.pop(context);
                },
                isSelected: _tabController!.index == 5,
              ),
              const SizedBox(
                height: 15,
              ),
              DrawerItem(
                icon: Icons.logout_rounded,
                label: 'Logout',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;
  final bool isSelected;
  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[300],
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inriaSans(
                color: isSelected ? Colors.white : Colors.grey[300],
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
