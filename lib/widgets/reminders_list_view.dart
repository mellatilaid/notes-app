import 'package:flutter/material.dart';
import 'package:note_app/models/reminder_model.dart';

class RemindersListView extends StatelessWidget {
  final List<ReminderModel> reminders;
  const RemindersListView({super.key, required this.reminders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 150,
          color: Colors.blue,
        );
      },
    );
  }
}
