import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/manage_disasters/manage_disasters_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';
import 'custom_select_box.dart';

class DisastersSelector extends StatefulWidget {
  final Function(int) onSelect;
  final String label;
  const DisastersSelector({
    super.key,
    required this.onSelect,
    required this.label,
  });

  @override
  State<DisastersSelector> createState() => _DisastersSelectorState();
}

class _DisastersSelectorState extends State<DisastersSelector> {
  final ManageDisastersBloc departmentBloc = ManageDisastersBloc();

  @override
  void initState() {
    departmentBloc.add(GetAllDisasterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ManageDisastersBloc>.value(
        value: departmentBloc,
        child: BlocConsumer<ManageDisastersBloc, ManageDisastersState>(
          listener: (context, state) {
            if (state is ManageDisastersFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    departmentBloc.add(GetAllDisasterEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ManageDisastersSuccessState) {
              return CustomSelectBox(
                iconData: Icons.landscape,
                items: List<CustomSelectBoxItem>.generate(
                  state.disasters.length,
                  (index) => CustomSelectBoxItem(
                    value: state.disasters[index]['id'],
                    label: state.disasters[index]['name'],
                  ),
                ),
                label: widget.label,
                onChange: (selected) {
                  widget.onSelect(selected != null ? selected.value : 0);
                },
              );
            } else if (state is ManageDisastersFailureState) {
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
