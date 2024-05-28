import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminder_cubit_states.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminders_cubit.dart';
import 'package:note_app/widgets/empty_widget.dart';
import 'package:note_app/widgets/reminders_list_view.dart';

class RemindersViewBodyBuilder extends StatelessWidget {
  const RemindersViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersCubit, RemindersStates>(
      builder: (context, state) {
        if (state is RemindersSuccussState) {
          if (state.reminders.isEmpty) {
            return const EmptyWidget(
                title: 'There is no tasks yet',
                message: 'Creat your first tasks list',
                imagePath: 'assets/task.png');
          }
          return RemindersListView(
            reminders: state.reminders,
          );
        } else {
          return const Center(
            child: Text('oops there was a problem, try later'),
          );
        }
      },
    );
  }
}
