import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/disaster_selector.dart';
import 'package:refuge_govt/widgets/emergency_service_selector.dart';
import 'package:refuge_govt/widgets/label_with_text.dart';

import '../../../blocs/manage_emergency_service_requests/manage_emergency_service_requests_bloc.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_select_box.dart';

class EmergencyServiceRequestsSection extends StatefulWidget {
  const EmergencyServiceRequestsSection({super.key});

  @override
  State<EmergencyServiceRequestsSection> createState() =>
      _EmergencyServiceRequestsSectionState();
}

class _EmergencyServiceRequestsSectionState
    extends State<EmergencyServiceRequestsSection> {
  String status = 'pending';
  int serviceId = 0;
  final ManageEmergencyServiceRequestsBloc manageEmergencyServicesBloc =
      ManageEmergencyServiceRequestsBloc();

  void getEmergencyService() {
    manageEmergencyServicesBloc.add(GetAllEmergencyServiceRequestsEvent(
      status: status,
      serviceId: serviceId != 0 ? serviceId : null,
    ));
  }

  @override
  void initState() {
    super.initState();
    getEmergencyService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<ManageEmergencyServiceRequestsBloc>.value(
            value: manageEmergencyServicesBloc,
            child: BlocConsumer<ManageEmergencyServiceRequestsBloc,
                ManageEmergencyServiceRequestsState>(
              listener: (context, state) {
                if (state is ManageEmergencyServiceRequestFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failed',
                      message: state.message,
                      primaryButtonLabel: 'Try Again',
                      primaryOnPressed: () {
                        getEmergencyService();
                        Navigator.pop(context);
                      },
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: 1000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          CustomButton(
                            color: status == 'pending' ? null : Colors.blue[50],
                            labelColor:
                                status == 'pending' ? null : Colors.blue[900],
                            onPressed: () {
                              status = 'pending';
                              setState(() {});
                              getEmergencyService();
                            },
                            label: 'Pending',
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            color:
                                status == 'accepted' ? null : Colors.blue[50],
                            labelColor:
                                status == 'accepted' ? null : Colors.blue[900],
                            onPressed: () {
                              status = 'accepted';
                              setState(() {});
                              getEmergencyService();
                            },
                            label: 'Accepted',
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            color:
                                status == 'completed' ? null : Colors.blue[50],
                            labelColor:
                                status == 'completed' ? null : Colors.blue[900],
                            onPressed: () {
                              status = 'completed';
                              setState(() {});
                              getEmergencyService();
                            },
                            label: 'Completed',
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 250,
                            child: EmergencyServicesSelector(
                              label: 'Emergency Service',
                              onSelect: (s) {
                                serviceId = s;
                                getEmergencyService();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state
                                is ManageEmergencyServiceRequestSuccessState
                            ? state.serviceRequests.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.serviceRequests.length,
                                    itemBuilder: (context, index) =>
                                        EmergencyServiceItem(
                                      serviceDetails:
                                          state.serviceRequests[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(
                                    child: Text(
                                        'No emergency service requests found'))
                            : const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyServiceItem extends StatelessWidget {
  final dynamic serviceDetails;
  const EmergencyServiceItem({
    super.key,
    required this.serviceDetails,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${serviceDetails['id']}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      serviceDetails['service']['name'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  serviceDetails['status'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
            const Divider(height: 30),
            Text(
              serviceDetails['remarks'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: '#${serviceDetails['refugee']['id']}',
                  text: serviceDetails['refugee']['name'],
                ),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'Phone Number',
                  text: serviceDetails['refugee']['phone'],
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: 'Disaster',
                  text: serviceDetails['refugee']['disaster']['name'],
                ),
                if (serviceDetails['refugee']['camp'] != null)
                  LabelWithText(
                    alignment: CrossAxisAlignment.end,
                    label: 'Camp',
                    text: serviceDetails['refugee']['camp']['name'],
                  ),
              ],
            ),
            if (serviceDetails['accepted_by'] != null)
              const Divider(height: 30),
            if (serviceDetails['accepted_by'] != null)
              Text(
                'Accepted By',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
              ),
            if (serviceDetails['accepted_by'] != null)
              const SizedBox(height: 5),
            if (serviceDetails['accepted_by'] != null)
              Text(
                serviceDetails['accepted_by_details']['name'],
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
