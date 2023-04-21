import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_govt/util/value_validators.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../blocs/manage_emergency_services/manage_emergency_services_bloc.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class EmergencyServicesSection extends StatefulWidget {
  const EmergencyServicesSection({super.key});

  @override
  State<EmergencyServicesSection> createState() =>
      _EmergencyServicesSectionState();
}

class _EmergencyServicesSectionState extends State<EmergencyServicesSection> {
  final ManageEmergencyServicesBloc manageEmergencyServicesBloc =
      ManageEmergencyServicesBloc();
  String? query;

  void getEmergencyServices() {
    manageEmergencyServicesBloc.add(GetAllEmergencyServiceEvent(query: query));
  }

  @override
  void initState() {
    super.initState();
    getEmergencyServices();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ManageEmergencyServicesBloc>.value(
        value: manageEmergencyServicesBloc,
        child: BlocConsumer<ManageEmergencyServicesBloc,
            ManageEmergencyServicesState>(
          listener: (context, state) {
            if (state is ManageEmergencyServicesFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    getEmergencyServices();
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
                                getEmergencyServices();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddEmergencyServiceForm(
                                  manageEmergencyServicesBloc:
                                      manageEmergencyServicesBloc,
                                ),
                              );
                            },
                            label: 'Add EmergencyService',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is ManageEmergencyServicesSuccessState
                            ? state.services.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.services.length,
                                    itemBuilder: (context, index) =>
                                        EmergencyServiceItem(
                                      serviceDetails: state.services[index],
                                      manageEmergencyServicesBloc:
                                          manageEmergencyServicesBloc,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(child: Text('No services found'))
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

class EmergencyServiceItem extends StatelessWidget {
  final dynamic serviceDetails;
  final ManageEmergencyServicesBloc manageEmergencyServicesBloc;
  const EmergencyServiceItem({
    super.key,
    required this.serviceDetails,
    required this.manageEmergencyServicesBloc,
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
                      '#${serviceDetails['id'].toString()}',
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
                      builder: (context) => AddEmergencyServiceForm(
                        manageEmergencyServicesBloc:
                            manageEmergencyServicesBloc,
                        serviceDetails: serviceDetails,
                      ),
                    );
                  },
                  iconData: Icons.edit,
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  onPressed: () {
                    manageEmergencyServicesBloc.add(
                      DeleteEmergencyServiceEvent(
                        serviceId: serviceDetails['id'],
                      ),
                    );
                  },
                  iconData: Icons.delete_forever,
                  color: Colors.red,
                ),
              ],
            ),
            Text(
              serviceDetails['name'],
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

class AddEmergencyServiceForm extends StatefulWidget {
  final ManageEmergencyServicesBloc manageEmergencyServicesBloc;
  final dynamic serviceDetails;
  const AddEmergencyServiceForm({
    super.key,
    required this.manageEmergencyServicesBloc,
    this.serviceDetails,
  });

  @override
  State<AddEmergencyServiceForm> createState() =>
      _AddEmergencyServiceFormState();
}

class _AddEmergencyServiceFormState extends State<AddEmergencyServiceForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController serviceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.serviceDetails != null) {
      serviceController.text = widget.serviceDetails['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'EmergencyService',
      message: 'Enter the following details to save a EmergencyService.',
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: serviceController,
              validator: alphaNumericValidator,
              decoration: const InputDecoration(
                hintText: 'EmergencyService',
                prefixIcon: Icon(Icons.emergency),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Save',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.serviceDetails != null) {
            widget.manageEmergencyServicesBloc.add(
              EditEmergencyServiceEvent(
                serviceId: widget.serviceDetails['id'],
                name: serviceController.text.trim(),
              ),
            );
          } else {
            widget.manageEmergencyServicesBloc.add(
              AddEmergencyServiceEvent(
                name: serviceController.text.trim(),
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
