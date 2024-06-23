import 'package:flutter/material.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/widgets/slidable_reminder_item.dart';

class SoonRemindersListView extends StatelessWidget {
  final List<ReminderModel> reminders;
  const SoonRemindersListView({super.key, required this.reminders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return SlidableReminderItem(
          index: index,
          reminder: reminders[index],
        );
      },
    );
  }
}
