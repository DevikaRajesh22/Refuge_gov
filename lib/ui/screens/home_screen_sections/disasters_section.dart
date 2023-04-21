import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_govt/blocs/manage_disasters/manage_disasters_bloc.dart';
import 'package:refuge_govt/util/value_validators.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class DisasterSection extends StatefulWidget {
  const DisasterSection({super.key});

  @override
  State<DisasterSection> createState() => _DisasterSectionState();
}

class _DisasterSectionState extends State<DisasterSection> {
  final ManageDisastersBloc manageDisastersBloc = ManageDisastersBloc();
  String? query;

  void getDisasters() {
    manageDisastersBloc.add(GetAllDisasterEvent(query: query));
  }

  @override
  void initState() {
    super.initState();
    getDisasters();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ManageDisastersBloc>.value(
        value: manageDisastersBloc,
        child: BlocConsumer<ManageDisastersBloc, ManageDisastersState>(
          listener: (context, state) {
            if (state is ManageDisastersFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    getDisasters();
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return Row(
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
                              onSearch: (value) {
                                query = value;
                                getDisasters();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddDisasterForm(
                                  manageDisastersBloc: manageDisastersBloc,
                                ),
                              );
                            },
                            label: 'Add Disaster',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is ManageDisastersSuccessState
                            ? state.disasters.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.disasters.length,
                                    itemBuilder: (context, index) =>
                                        DisasterItem(
                                      disasterDetails: state.disasters[index],
                                      manageDisastersBloc: manageDisastersBloc,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(
                                    child: Text('No disasters found'))
                            : const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DisasterItem extends StatelessWidget {
  final dynamic disasterDetails;
  final ManageDisastersBloc manageDisastersBloc;
  const DisasterItem({
    super.key,
    required this.disasterDetails,
    required this.manageDisastersBloc,
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
                      '#${disasterDetails['id'].toString()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddDisasterForm(
                        manageDisastersBloc: manageDisastersBloc,
                        disasterDetails: disasterDetails,
                      ),
                    );
                  },
                  iconData: Icons.edit,
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  onPressed: () {
                    manageDisastersBloc.add(
                      DeleteDisasterEvent(
                        disasterId: disasterDetails['id'],
                      ),
                    );
                  },
                  iconData: Icons.delete_forever,
                  color: Colors.red,
                ),
              ],
            ),
            Text(
              disasterDetails['name'],
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

class AddDisasterForm extends StatefulWidget {
  final ManageDisastersBloc manageDisastersBloc;
  final dynamic disasterDetails;
  const AddDisasterForm({
    super.key,
    required this.manageDisastersBloc,
    this.disasterDetails,
  });

  @override
  State<AddDisasterForm> createState() => _AddDisasterFormState();
}

class _AddDisasterFormState extends State<AddDisasterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController disasterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.disasterDetails != null) {
      disasterController.text = widget.disasterDetails['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Disaster',
      message: 'Enter the following details to save a Disaster.',
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: disasterController,
              validator: alphaNumericValidator,
              decoration: const InputDecoration(
                hintText: 'Disaster',
                prefixIcon: Icon(Icons.landscape),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Save',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.disasterDetails != null) {
            widget.manageDisastersBloc.add(
              EditDisasterEvent(
                disasterId: widget.disasterDetails['id'],
                name: disasterController.text.trim(),
              ),
            );
          } else {
            widget.manageDisastersBloc.add(
              AddDisasterEvent(
                name: disasterController.text.trim(),
              ),
            );
          }

          Navigator.pop(context);
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
