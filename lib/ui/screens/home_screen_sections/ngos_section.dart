import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class NgosSection extends StatelessWidget {
  const NgosSection({super.key});

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
                          builder: (context) => AddNgoForm(),
                        );
                      },
                      label: 'Add NGO',
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
                    itemBuilder: (context, index) => NgosItem(),
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

class NgosItem extends StatelessWidget {
  const NgosItem({
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
            const Divider(),
            Text(
              'Name',
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
            const SizedBox(height: 10),
            Text(
              'Email',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'ngo@ngodomain.com',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone No',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              '9878676543',
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

class AddNgoForm extends StatelessWidget {
  const AddNgoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add NGO',
      message: 'Enter the following details to add an NGO.',
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.business),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Phone Number',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
    );
  }
}
