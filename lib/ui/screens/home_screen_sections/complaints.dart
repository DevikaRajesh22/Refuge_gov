import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';

import '../../../blocs/complaints/complaints_bloc.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class ComplaintsSection extends StatefulWidget {
  const ComplaintsSection({super.key});

  @override
  State<ComplaintsSection> createState() => _ComplaintsSectionState();
}

class _ComplaintsSectionState extends State<ComplaintsSection> {
  final ComplaintsBloc complaintsBloc = ComplaintsBloc();
  @override
  void initState() {
    super.initState();
    complaintsBloc.add(GetAllComplaintsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintsBloc>.value(
      value: complaintsBloc,
      child: BlocConsumer<ComplaintsBloc, ComplaintsState>(
        listener: (context, state) {
          if (state is ComplaintsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                message: state.message,
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: state is ComplaintsSuccessState
                      ? state.complaints.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                                right: 20,
                                bottom: 100,
                              ),
                              itemCount: state.complaints.length,
                              itemBuilder: (context, index) => ComplaintsItem(
                                complaintDetails: state.complaints[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                            )
                          : const Center(child: Text('No complaints found'))
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ComplaintsItem extends StatelessWidget {
  final dynamic complaintDetails;

  const ComplaintsItem({
    super.key,
    this.complaintDetails,
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
            Text(
              '#${complaintDetails['id']}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
            ),
            const Divider(),
            Text(
              complaintDetails['complaint'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(),
            Text(
              DateFormat('hh:mm a dd/MM/yyyy').format(
                  DateTime.parse(complaintDetails['created_at']).toLocal()),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
