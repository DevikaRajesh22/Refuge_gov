import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/manage_members/manage_members_bloc.dart';
import '../../../util/get_age.dart';
import '../../../widgets/camp_selector.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/label_with_text.dart';

class CampsAndRegugeesSection extends StatefulWidget {
  const CampsAndRegugeesSection({super.key});

  @override
  State<CampsAndRegugeesSection> createState() =>
      _CampsAndRegugeesSectionState();
}

class _CampsAndRegugeesSectionState extends State<CampsAndRegugeesSection> {
  final ManageMembersBloc manageMembersBloc = ManageMembersBloc();

  int selectedCampId = 0;

  @override
  void initState() {
    super.initState();
    getMembers();
  }

  void getMembers() {
    manageMembersBloc.add(
      GetAllMembersEvent(
        campId: selectedCampId != 0 ? selectedCampId : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ManageMembersBloc>.value(
        value: manageMembersBloc,
        child: BlocConsumer<ManageMembersBloc, ManageMembersState>(
          listener: (context, state) {
            if (state is ManageMembersFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  message: state.message,
                  primaryButtonLabel: 'Try Again',
                  primaryOnPressed: () {
                    getMembers();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            child: CampSelector(
                              onSelect: (id) {
                                selectedCampId = id;
                                getMembers();
                              },
                              label: 'Select Camp',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is ManageMembersSuccessState
                            ? state.members.isNotEmpty
                                ? SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: List<Widget>.generate(
                                        state.members.length,
                                        (index) => MemberItem(
                                          refresh: () {
                                            getMembers();
                                          },
                                          manageMembersBloc: manageMembersBloc,
                                          memberDetails: state.members[index],
                                        ),
                                      ),
                                    ),
                                  )
                                : const Center(child: Text('No members found'))
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

class MemberItem extends StatelessWidget {
  final dynamic memberDetails;
  final ManageMembersBloc manageMembersBloc;
  final Function() refresh;
  const MemberItem({
    super.key,
    required this.memberDetails,
    required this.manageMembersBloc,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: SizedBox(
          width: 300,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '#${memberDetails['id'].toString()}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    memberDetails['name'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${getAge(DateTime.parse(memberDetails['dob']))} ${memberDetails['gender']}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    memberDetails['phone'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Divider(height: 15),
                  Text(
                    memberDetails['disaster']['name'],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (memberDetails['camp_id'] != null)
                    const Divider(height: 20),
                  if (memberDetails['camp_id'] != null)
                    LabelWithText(
                      label: 'Camp',
                      text: memberDetails['camp']['name'],
                    ),
                  if (memberDetails['camp_id'] != null)
                    const SizedBox(height: 5),
                  if (memberDetails['camp_id'] != null)
                    Text(
                      memberDetails['camp']['address'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssignCampForm extends StatelessWidget {
  final int refugeeId;
  final ManageMembersBloc manageMembersBloc;
  const AssignCampForm({
    super.key,
    required this.refugeeId,
    required this.manageMembersBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Assign Camp',
      message: 'Select the camp to assign the refugee.',
      content: Column(
        children: [
          CampSelector(
            onSelect: (id) {
              if (id != 0) {
                manageMembersBloc.add(
                  AssignCampMemberEvent(
                    memberId: refugeeId,
                    campId: id,
                  ),
                );
                Navigator.pop(context);
              }
            },
            label: 'Select Camp',
          ),
        ],
      ),
    );
  }
}
