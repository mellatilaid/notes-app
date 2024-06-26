import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/add_reminder_cuibit/add_reminder_cubit.dart';
import 'package:note_app/widgets/add_tasks_reminder_alert_dialog_body.dart';

class AddTasksReminderAlertDialog extends StatelessWidget {
  final String? title;
  const AddTasksReminderAlertDialog({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddReminderCubit(),
      child: AddTasksReminderAlertDialogBody(
        title: title,
      ),
    );
  }
}
