import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_dropdown.dart';

class EmergencyServiceRequestsSection extends StatelessWidget {
  const EmergencyServiceRequestsSection({super.key});

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
                      label: 'Service',
                      leadingIcon: Icons.bar_chart_outlined,
                      items: const [
                        {
                          'name': 'All',
                          'value': 'all',
                        },
                        {
                          'name': 'Service1',
                          'value': 'Extreme',
                        },
                        {
                          'name': 'Service2',
                          'value': 'serious',
                        },
                        {
                          'name': 'Service3',
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
                    itemBuilder: (context, index) => EmergencyItem(),
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

class EmergencyItem extends StatelessWidget {
  const EmergencyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.orange[50],
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
                Text(
                  '#123123',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
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
