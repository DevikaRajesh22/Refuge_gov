import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/manage_camp/manage_camp_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';
import 'custom_select_box.dart';

class CampSelector extends StatefulWidget {
  final Function(int) onSelect;
  final String label;
  const CampSelector({
    super.key,
    required this.onSelect,
    required this.label,
  });

  @override
  State<CampSelector> createState() => _CampSelectorState();
}

class _CampSelectorState extends State<CampSelector> {
  final ManageCampBloc departmentBloc = ManageCampBloc();

  @override
  void initState() {
    departmentBloc.add(GetAllCampEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ManageCampBloc>.value(
        value: departmentBloc,
        child: BlocConsumer<ManageCampBloc, ManageCampState>(
          listener: (context, state) {
            if (state is ManageCampFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    departmentBloc.add(GetAllCampEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ManageCampSuccessState) {
              return CustomSelectBox(
                iconData: Icons.landscape,
                items: List<CustomSelectBoxItem>.generate(
                  state.camps.length,
                  (index) => CustomSelectBoxItem(
                    value: state.camps[index]['id'],
                    label: state.camps[index]['name'],
                  ),
                ),
                label: widget.label,
                onChange: (selected) {
                  widget.onSelect(selected != null ? selected.value : 0);
                },
              );
            } else if (state is ManageCampFailureState) {
              return const SizedBox();
            } else {
              return const SizedBox(
                width: 100,
                child: SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
