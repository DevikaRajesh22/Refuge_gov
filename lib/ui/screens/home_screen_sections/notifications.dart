import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:refuge_govt/widgets/custom_button.dart';
import 'package:refuge_govt/widgets/custom_icon_button.dart';

import '../../../blocs/notifications/notifications_bloc.dart';
import '../../../util/value_validators.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class NotificationsSection extends StatefulWidget {
  const NotificationsSection({super.key});

  @override
  State<NotificationsSection> createState() => _NotificationsSectionState();
}

class _NotificationsSectionState extends State<NotificationsSection> {
  final NotificationsBloc notificationsBloc = NotificationsBloc();
  @override
  void initState() {
    super.initState();
    notificationsBloc.add(GetAllNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<NotificationsBloc>.value(
            value: notificationsBloc,
            child: BlocConsumer<NotificationsBloc, NotificationsState>(
              listener: (context, state) {
                if (state is NotificationsFailureState) {
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
                return SizedBox(
                  width: 1000,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddNotificationForm(
                              notificationsBloc: notificationsBloc,
                            ),
                          );
                        },
                        label: 'Add Notification',
                      ),
                      const SizedBox(height: 20),
                      const Divider(height: 1),
                      Expanded(
                        child: state is NotificationsSuccessState
                            ? state.notifications.isNotEmpty
                                ? ListView.separated(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 100,
                                    ),
                                    itemCount: state.notifications.length,
                                    itemBuilder: (context, index) =>
                                        NotificationsItem(
                                      notificationDetails:
                                          state.notifications[index],
                                      notificationsBloc: notificationsBloc,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  )
                                : const Center(
                                    child: Text('No notifications found'))
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

class NotificationsItem extends StatelessWidget {
  final dynamic notificationDetails;
  final NotificationsBloc notificationsBloc;
  const NotificationsItem({
    super.key,
    required this.notificationDetails,
    required this.notificationsBloc,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${notificationDetails['id'].toString()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                CustomIconButton(
                  onPressed: () {
                    notificationsBloc.add(
                      DeleteNotificationsEvent(
                        notificationId: notificationDetails['id'],
                      ),
                    );
                  },
                  iconData: Icons.delete,
                  color: Colors.red,
                ),
              ],
            ),
            const Divider(),
            Text(
              notificationDetails['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              notificationDetails['message'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(),
            Text(
              DateFormat('hh:mm a dd/MM/yyyy').format(
                  DateTime.parse(notificationDetails['created_at']).toLocal()),
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

class AddNotificationForm extends StatefulWidget {
  final NotificationsBloc notificationsBloc;
  const AddNotificationForm({
    super.key,
    required this.notificationsBloc,
  });

  @override
  State<AddNotificationForm> createState() => _AddNotificationFormState();
}

class _AddNotificationFormState extends State<AddNotificationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _desC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Notification',
      message: 'Enter the following details to add notification.',
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleC,
              validator: alphaNumericValidator,
              decoration: const InputDecoration(
                hintText: 'Title',
                prefixIcon: Icon(Icons.notification_add),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _desC,
              validator: alphaNumericValidator,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Message',
                prefixIcon: Icon(Icons.description),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          widget.notificationsBloc.add(
            AddNotificationsEvent(
              title: _titleC.text.trim(),
              message: _desC.text.trim(),
            ),
          );
          Navigator.pop(context);
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
