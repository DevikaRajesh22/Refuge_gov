import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_govt/blocs/ngo/ngo_bloc.dart';
import 'package:refuge_govt/util/value_validators.dart';
import 'package:refuge_govt/widgets/custom_action_button.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_dropdown.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';
import 'package:refuge_govt/widgets/custom_search.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/label_with_text.dart';

class NgosSection extends StatefulWidget {
  const NgosSection({super.key});

  @override
  State<NgosSection> createState() => _NgosSectionState();
}

class _NgosSectionState extends State<NgosSection> {
  final NgoBloc ngoBloc = NgoBloc();
  String? query;

  @override
  void initState() {
    super.initState();
    getNgo();
  }

  void getNgo() {
    ngoBloc.add(GetAllNgoEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<NgoBloc>.value(
            value: ngoBloc,
            child: BlocConsumer<NgoBloc, NgoState>(
              listener: (context, state) {
                if (state is NgoFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failure',
                      message: state.message,
                      primaryButtonLabel: 'Retry',
                      primaryOnPressed: () {
                        getNgo();
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
                                getNgo();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AddNgoForm(ngoBloc: ngoBloc),
                              );
                            },
                            label: 'Add NGO',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is NgoSuccessState
                            ? state.ngos.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.ngos.length,
                                    itemBuilder: (context, index) => NgosItem(
                                      ngoDetails: state.ngos[index],
                                      ngoBloc: ngoBloc,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NgosItem extends StatelessWidget {
  final dynamic ngoDetails;
  final NgoBloc ngoBloc;
  const NgosItem({
    super.key,
    required this.ngoDetails,
    required this.ngoBloc,
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
                      '#${ngoDetails['id'].toString()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                CustomActionButton(
                  iconData: Icons.block,
                  onPressed: () {
                    ngoBloc.add(
                      ChangeStatusNgoEvent(
                        userId: ngoDetails['user_id'],
                        status: ngoDetails['status'] == 'active'
                            ? 'blocked'
                            : 'active',
                      ),
                    );
                  },
                  label:
                      ngoDetails['status'] == 'active' ? 'Block' : 'Activate',
                  color: ngoDetails['status'] == 'active'
                      ? Colors.deepOrange
                      : Colors.green,
                ),
                const SizedBox(width: 10),
                CustomActionButton(
                  iconData: Icons.edit,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddNgoForm(
                        ngoBloc: ngoBloc,
                        ngoDetails: ngoDetails,
                      ),
                    );
                  },
                  label: 'Edit',
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomActionButton(
                  iconData: Icons.delete_forever,
                  onPressed: () {
                    ngoBloc.add(DeleteNgoEvent(userId: ngoDetails['user_id']));
                  },
                  label: 'Delete',
                  color: Colors.red,
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              ngoDetails['name'],
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: 'Email',
                  text: ngoDetails['email'],
                ),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'Phone Number',
                  text: ngoDetails['phone'],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelWithText(
                  label: 'Registration No',
                  text: ngoDetails['registration_no'],
                ),
                LabelWithText(
                  alignment: CrossAxisAlignment.end,
                  label: 'File Reference No',
                  text: ngoDetails['file_reference_no'],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddNgoForm extends StatefulWidget {
  final NgoBloc ngoBloc;
  final dynamic ngoDetails;
  const AddNgoForm({
    super.key,
    required this.ngoBloc,
    this.ngoDetails,
  });

  @override
  State<AddNgoForm> createState() => _AddNgoFormState();
}

class _AddNgoFormState extends State<AddNgoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  final TextEditingController _confirmPasswordC = TextEditingController();
  final TextEditingController _registrationNoC = TextEditingController();
  final TextEditingController _fileReferenceC = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    if (widget.ngoDetails != null) {
      _nameC.text = widget.ngoDetails!['name'];
      _emailC.text = widget.ngoDetails!['email'];
      _phoneC.text = widget.ngoDetails!['phone'];
      _registrationNoC.text = widget.ngoDetails!['registration_no'];
      _fileReferenceC.text = widget.ngoDetails!['file_reference_no'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add NGO',
      message: 'Enter the following details to add an NGO.',
      width: 700,
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameC,
                        validator: alphaNumericValidator,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(Icons.business),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneC,
                        validator: phoneValidator,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _registrationNoC,
                        validator: alphaNumericValidator,
                        decoration: const InputDecoration(
                          hintText: 'Registration No.',
                          prefixIcon: Icon(Icons.app_registration),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _fileReferenceC,
                        validator: alphaNumericValidator,
                        decoration: const InputDecoration(
                          hintText: 'File Reference No.',
                          prefixIcon: Icon(Icons.file_copy),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailC,
                        validator: emailValidator,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: _isObscure,
                        controller: _passwordC,
                        validator: (value) {
                          if (widget.ngoDetails != null) {
                            if (value != null && value.isNotEmpty) {
                              return passwordValidator(value);
                            } else {
                              return null;
                            }
                          } else {
                            return passwordValidator(value);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _isObscure = !_isObscure;
                              setState(() {});
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: _isObscure,
                        controller: _confirmPasswordC,
                        validator: (value) {
                          if (widget.ngoDetails != null) {
                            if (value != null && value.isNotEmpty) {
                              return confirmPasswordValidator(
                                  value, _passwordC.text.trim());
                            } else {
                              return null;
                            }
                          } else {
                            return confirmPasswordValidator(
                                value, _passwordC.text.trim());
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.ngoDetails != null) {
            widget.ngoBloc.add(
              EditNgoEvent(
                userId: widget.ngoDetails['user_id'],
                name: _nameC.text.trim(),
                phone: _phoneC.text.trim(),
                email: _emailC.text.trim(),
                password: _passwordC.text.trim().isNotEmpty
                    ? _passwordC.text.trim()
                    : null,
                registrationNo: _registrationNoC.text.trim(),
                fileReferenceNo: _fileReferenceC.text.trim(),
              ),
            );
          } else {
            widget.ngoBloc.add(
              AddNgoEvent(
                name: _nameC.text.trim(),
                phone: _phoneC.text.trim(),
                email: _emailC.text.trim(),
                password: _passwordC.text.trim(),
                registrationNo: _registrationNoC.text.trim(),
                fileReferenceNo: _fileReferenceC.text.trim(),
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
