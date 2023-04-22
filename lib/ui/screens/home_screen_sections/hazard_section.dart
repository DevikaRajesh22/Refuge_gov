import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_govt/blocs/manage_hazards/manage_hazards_bloc.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/disaster_selector.dart';
import 'package:refuge_govt/widgets/label_with_text.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_select_box.dart';

class HazardRequestsSection extends StatefulWidget {
  const HazardRequestsSection({super.key});

  @override
  State<HazardRequestsSection> createState() => _HazardRequestsSectionState();
}

class _HazardRequestsSectionState extends State<HazardRequestsSection> {
  String level = 'extreme', status = 'pending';
  final ManageHazardsBloc manageHazardsBloc = ManageHazardsBloc();

  void getHazard() {
    manageHazardsBloc.add(GetAllHazardsEvent(
      status: status,
      level: level,
    ));
  }

  @override
  void initState() {
    super.initState();
    getHazard();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<ManageHazardsBloc>.value(
            value: manageHazardsBloc,
            child: BlocConsumer<ManageHazardsBloc, ManageHazardsState>(
              listener: (context, state) {
                if (state is ManageHazardsFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failed',
                      message: state.message,
                      primaryButtonLabel: 'Try Again',
                      primaryOnPressed: () {
                        manageHazardsBloc.add(GetAllHazardsEvent());
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
                              getHazard();
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
                              getHazard();
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
                              getHazard();
                            },
                            label: 'Completed',
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 250,
                            child: CustomSelectBox(
                              items: [
                                CustomSelectBoxItem(
                                  label: 'Moderate',
                                  value: 'moderate',
                                ),
                                CustomSelectBoxItem(
                                  label: 'Serious',
                                  value: 'serious',
                                ),
                                CustomSelectBoxItem(
                                  label: 'Extreme',
                                  value: 'extreme',
                                ),
                              ],
                              label: '$level Level',
                              onChange: (item) {
                                level = item != null ? item.value : 'extreme';
                                getHazard();
                              },
                              iconData: Icons.warning,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is ManageHazardsSuccessState
                            ? state.hazards.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.hazards.length,
                                    itemBuilder: (context, index) => HazardItem(
                                      hazardDetails: state.hazards[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(child: Text('No hazards found'))
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

class HazardItem extends StatelessWidget {
  final dynamic hazardDetails;
  const HazardItem({
    super.key,
    required this.hazardDetails,
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
                      '#${hazardDetails['id']}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      hazardDetails['level'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  hazardDetails['status'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
            const Divider(height: 30),
            Text(
              hazardDetails['remarks'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: '#${hazardDetails['refugee']['id']}',
                  text: hazardDetails['refugee']['name'],
                ),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'Phone Number',
                  text: hazardDetails['refugee']['phone'],
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: 'Disaster',
                  text: hazardDetails['refugee']['disaster']['name'],
                ),
                if (hazardDetails['refugee']['camp'] != null)
                  LabelWithText(
                    alignment: CrossAxisAlignment.end,
                    label: 'Camp',
                    text: hazardDetails['refugee']['camp']['name'],
                  ),
              ],
            ),
            if (hazardDetails['accepted_by'] != null) const Divider(height: 30),
            if (hazardDetails['accepted_by'] != null)
              Text(
                'Accepted By',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
              ),
            if (hazardDetails['accepted_by'] != null) const SizedBox(height: 5),
            if (hazardDetails['accepted_by'] != null)
              Text(
                hazardDetails['accepted_by_details']['name'],
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
