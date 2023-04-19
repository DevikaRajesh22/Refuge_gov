import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class DisasterSection extends StatelessWidget {
  const DisasterSection({super.key});

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
                    Expanded(
                      child: CustomSearch(
                        onSearch: (value) {},
                      ),
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddDisasterForm(),
                        );
                      },
                      label: 'Add Disaster',
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
                    itemBuilder: (context, index) => DisasterItem(),
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

class DisasterItem extends StatelessWidget {
  const DisasterItem({
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
                  ],
                ),
                const Expanded(child: SizedBox()),
                CustomIconButton(
                  onPressed: () {},
                  iconData: Icons.edit,
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  onPressed: () {},
                  iconData: Icons.delete_forever,
                  color: Colors.red,
                ),
              ],
            ),
            Text(
              'Disaster Name',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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

class AddDisasterForm extends StatelessWidget {
  const AddDisasterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Disaster',
      message: 'Enter the following details to add a Disaster.',
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Disaster',
              prefixIcon: Icon(Icons.landscape),
            ),
          ),
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
    );
  }
}
