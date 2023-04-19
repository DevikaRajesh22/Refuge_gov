import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';

import '../../../widgets/custom_card.dart';

class HazardRequestsSection extends StatelessWidget {
  const HazardRequestsSection({super.key});

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
                      label: 'Pending',
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      color: Colors.blue[50],
                      labelColor: Colors.blue[900],
                      onPressed: () {},
                      label: 'Accepted',
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      color: Colors.blue[50],
                      labelColor: Colors.blue[900],
                      onPressed: () {},
                      label: 'Completed',
                    ),
                    const Expanded(child: SizedBox()),
                    CustomDropdownButton(
                      onChange: (value) {},
                      label: 'Level',
                      leadingIcon: Icons.bar_chart_outlined,
                      items: const [
                        {
                          'name': 'All',
                          'value': 'all',
                        },
                        {
                          'name': 'Extreme',
                          'value': 'Extreme',
                        },
                        {
                          'name': 'Serious',
                          'value': 'serious',
                        },
                        {
                          'name': 'Moderate',
                          'value': 'moderate',
                        }
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(height: 1),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 100,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => HazardItem(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
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

class HazardItem extends StatelessWidget {
  const HazardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#123123',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      'Extreme',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Pending',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
            const Divider(),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis nulla vestibulum, bibendum magna a, eleifend est. Suspendisse potenti. In hac habitasse platea dictumst. Proin in urna at felis dictum dignissim.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(),
            Text(
              'Accepted By',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'Some NGO Pvt.Ltd',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
