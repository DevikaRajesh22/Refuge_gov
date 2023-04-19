// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medcare_admin/blocs/department_bloc/department_bloc.dart';
// import 'package:medcare_admin/widgets/custom_card.dart';

// import 'custom_alert_dialog.dart';

// class DepartmentSelector extends StatefulWidget {
//   final Function(int) onSelect;
//   final int selectedDepartment;
//   const DepartmentSelector({
//     super.key,
//     required this.onSelect,
//     this.selectedDepartment = 0,
//   });

//   @override
//   State<DepartmentSelector> createState() => _DepartmentSelectorState();
// }

// class _DepartmentSelectorState extends State<DepartmentSelector> {
//   final DepartmentBloc departmentBloc = DepartmentBloc();

//   @override
//   void initState() {
//     departmentBloc.add(GetAllDepartmentsEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       child: BlocProvider<DepartmentBloc>.value(
//         value: departmentBloc,
//         child: BlocConsumer<DepartmentBloc, DepartmentState>(
//           listener: (context, state) {
//             if (state is DepartmentFailureState) {
//               showDialog(
//                 context: context,
//                 builder: (context) => CustomAlertDialog(
//                   title: 'Failed!',
//                   message: state.message,
//                   primaryButtonLabel: 'Retry',
//                   primaryOnPressed: () {
//                     departmentBloc.add(GetAllDepartmentsEvent());
//                     Navigator.pop(context);
//                   },
//                 ),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is DepartmentSuccessState) {
//               return DropdownMenu(
//                 hintText: 'All Departments',
//                 initialSelection: widget.selectedDepartment,
//                 onSelected: (value) {
//                   widget.onSelect(value);
//                 },
//                 inputDecorationTheme: InputDecorationTheme(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 dropdownMenuEntries: [
//                   const DropdownMenuEntry(
//                     value: 0,
//                     label: 'All Departments',
//                   ),
//                   ...List<DropdownMenuEntry>.generate(
//                     state.departments.length,
//                     (index) => DropdownMenuEntry(
//                       value: state.departments[index]['id'],
//                       label: state.departments[index]['name'],
//                     ),
//                   ),
//                 ],
//               );
//             } else if (state is DepartmentFailureState) {
//               return const SizedBox();
//             } else {
//               return const SizedBox(
//                 width: 100,
//                 child: SizedBox(
//                   height: 2,
//                   child: LinearProgressIndicator(),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
