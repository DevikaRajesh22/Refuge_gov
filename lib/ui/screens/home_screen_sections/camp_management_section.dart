import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/manage_camp/manage_camp_bloc.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_search.dart';

class CampManagementSection extends StatefulWidget {
  const CampManagementSection({super.key});

  @override
  State<CampManagementSection> createState() => _CampManagementSectionState();
}

class _CampManagementSectionState extends State<CampManagementSection> {
  final ManageCampBloc manageCampBloc = ManageCampBloc();
  String? query;

  @override
  void initState() {
    super.initState();
    getCamps();
  }

  void getCamps() {
    manageCampBloc.add(GetAllCampEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<ManageCampBloc>.value(
            value: manageCampBloc,
            child: BlocConsumer<ManageCampBloc, ManageCampState>(
              listener: (context, state) {
                if (state is ManageCampFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failed',
                      message: state.message,
                      primaryButtonLabel: 'Try Again',
                      primaryOnPressed: () {
                        getCamps();
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
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: CustomSearch(
                              onSearch: (value) {
                                query = value;
                                getCamps();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is ManageCampSuccessState
                            ? state.camps.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.camps.length,
                                    itemBuilder: (context, index) =>
                                        CampManagementItem(
                                      manageCampBloc: manageCampBloc,
                                      campDetails: state.camps[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(child: Text('No camps found'))
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

class CampManagementItem extends StatelessWidget {
  final ManageCampBloc manageCampBloc;
  final dynamic campDetails;
  const CampManagementItem({
    super.key,
    required this.manageCampBloc,
    required this.campDetails,
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
                      '#${campDetails['id'].toString()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const Divider(height: 30),
            Text(
              'Name',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              campDetails['name'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const Divider(height: 30),
            Text(
              'Ngo',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              campDetails['ngo']['name'],
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
