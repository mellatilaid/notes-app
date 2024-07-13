import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/widgets/empty_widget.dart';
import 'package:note_app/widgets/slidable_reminder_item.dart';

class RemindersListView extends StatelessWidget {
  final List<ReminderModel> reminders;
  final ReminderSource reminderSource;
  const RemindersListView(
      {super.key, required this.reminders, required this.reminderSource});

  @override
  Widget build(BuildContext context) {
    if (reminders.isEmpty) {
      return const EmptyWidget(
        title: '',
        message: '',
        imagePath: 'assets/reminder.png',
      );
    }
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        key: UniqueKey(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: reminders.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: SlidableReminderItem(
                  reminderSource: reminderSource,
                  index: index,
                  reminder: reminders[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
