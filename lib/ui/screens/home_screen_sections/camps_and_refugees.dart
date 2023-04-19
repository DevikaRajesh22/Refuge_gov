import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_dropdown.dart';

class CampsAndRegugeesSection extends StatelessWidget {
  const CampsAndRegugeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 1000,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    CustomButton(
                      onPressed: () {},
                      label: 'No Camp',
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      color: Colors.blue[50],
                      labelColor: Colors.blue[900],
                      onPressed: () {},
                      label: 'Has Camp',
                    ),
                    const Expanded(child: SizedBox()),
                    CustomDropdownButton(
                      onChange: (value) {},
                      label: 'Camp',
                      leadingIcon: Icons.bar_chart_outlined,
                      items: const [
                        {
                          'name': 'All',
                          'value': 'all',
                        },
                        {
                          'name': 'Camp1',
                          'value': 'Extreme',
                        },
                        {
                          'name': 'Camp2',
                          'value': 'serious',
                        },
                        {
                          'name': 'Camp3',
                          'value': 'moderate',
                        }
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List<Widget>.generate(
                        30,
                        (index) => const MemberItem(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SizedBox(
        width: 320,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#532452',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Member Name',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                '26 Male',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Flood 2023',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(),
              Text(
                'Camp1',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
