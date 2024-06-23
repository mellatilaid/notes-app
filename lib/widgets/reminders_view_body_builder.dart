import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminder_cubit_states.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/widgets/reminders_list_view.dart';

class RemindersViewBodyBuilder extends StatelessWidget {
  const RemindersViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersCubit, RemindersStates>(
      builder: (context, state) {
        if (state is RemindersSuccussState) {
          return TabBarView(children: [
            RemindersListView(
              reminderSource: ReminderSource.soonReminders,
              reminders: state.soonReminders,
            ),
            RemindersListView(
              reminderSource: ReminderSource.futureReminders,
              reminders: state.futureReminders,
            ),
            RemindersListView(
              reminderSource: ReminderSource.passedReminders,
              reminders: state.passedReminders,
            )
          ]);
        } else {
          return const Center(
            child: Text('oops there was a problem, try later'),
          );
        }
      },
    );
  }
}
