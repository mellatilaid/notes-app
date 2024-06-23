import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/add_reminder_cuibit/add_reminder_cubit.dart';
import 'package:note_app/cubits/reminders_cubits/add_reminder_cuibit/add_reminder_cubit_states.dart';
import 'package:note_app/widgets/add_reminder_alert_dialog_body.dart';

import '../cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';

class AddReminderAlertDialog extends StatelessWidget {
  const AddReminderAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddReminderCubit(),
      child: BlocListener<AddReminderCubit, AddReminderState>(
        listener: (context, state) {
          if (state is AddReminderSuccuss) {
            Navigator.pop(context);
            BlocProvider.of<RemindersCubit>(context).fetchAllNotes();
          } else if (state is AddReminderFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        child: const AddReminderAlertDialogBody(),
      ),
    );
  }
}
