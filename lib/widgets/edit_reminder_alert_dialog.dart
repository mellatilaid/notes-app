import 'package:flutter/material.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/widgets/edit_reminder_alert_dialog_body.dart';

class EditReminderAlertDialog extends StatelessWidget {
  final ReminderModel reminder;
  const EditReminderAlertDialog({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    return EditReminderAlertDialogBody(
      reminder: reminder,
    );
  }
}
