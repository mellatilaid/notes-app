import 'package:flutter/material.dart';
import 'package:note_app/widgets/reminder_view_body.dart';

import '../widgets/add_tasks_list_alert_dialog.dart';
import '../widgets/custom_floating_action_button.dart';

class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('Reminders'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const ReminderViewBody(),
      floatingActionButton: CustomFlaotingActionButton(
        child: const Icon(Icons.add),
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const AddTasksListAlertDialog();
            },
          );
        },
      ),
    );
  }
}
