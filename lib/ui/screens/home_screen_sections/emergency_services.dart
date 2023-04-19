import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class EmergencyServicesSection extends StatelessWidget {
  const EmergencyServicesSection({super.key});

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
                          builder: (context) => AddEmergencyServiceForm(),
                        );
                      },
                      label: 'Add Emergency Service',
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
                    itemBuilder: (context, index) => EmergencyServicesItem(),
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

class EmergencyServicesItem extends StatelessWidget {
  const EmergencyServicesItem({
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
              'Service Name',
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

class AddEmergencyServiceForm extends StatelessWidget {
  const AddEmergencyServiceForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Emergency Services',
      message: 'Enter the following details to add a Emergency Service.',
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Emergency Service',
              prefixIcon: Icon(Icons.emergency),
            ),
          ),
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
    );
  }
}
