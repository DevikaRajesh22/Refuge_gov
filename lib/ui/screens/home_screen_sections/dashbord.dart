import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/dashcard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1604079628040-94301bb21b91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: SizedBox(
            width: 1100,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                DashCard(
                  label: 'Hazard Requests',
                  value: '10000',
                  iconData: Icons.warning,
                ),
                DashCard(
                  label: 'Emergency Requests',
                  value: '10000',
                  iconData: Icons.report,
                ),
                DashCard(
                  label: 'Refugees',
                  value: '10000',
                  iconData: Icons.people,
                ),
                DashCard(
                  label: 'Camps',
                  value: '10000',
                  iconData: Icons.holiday_village,
                ),
                DashCard(
                  label: 'Disasters',
                  value: '10000',
                  iconData: Icons.landscape,
                ),
                DashCard(
                  label: 'NGOs',
                  value: '10000',
                  iconData: Icons.business,
                ),
                DashCard(
                  label: 'Complaints',
                  value: '10000',
                  iconData: Icons.info,
                ),
                DashCard(
                  label: 'Suggestions',
                  value: '10000',
                  iconData: Icons.offline_bolt,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
