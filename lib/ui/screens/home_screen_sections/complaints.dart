import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';

import '../../../widgets/custom_card.dart';

class ComplaintsSection extends StatelessWidget {
  const ComplaintsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 1000,
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 100,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => ComplaintsItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintsItem extends StatelessWidget {
  const ComplaintsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#123123',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                CustomIconButton(
                  onPressed: () {},
                  iconData: Icons.person,
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
          ],
        ),
      ),
    );
  }
}
