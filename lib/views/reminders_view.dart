import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/views/search_view.dart';
import 'package:note_app/widgets/add_reminder_alert_dialog.dart';
import 'package:note_app/widgets/custom_drawer.dart';
import 'package:note_app/widgets/reminder_view_body.dart';

import '../widgets/custom_floating_action_button.dart';

class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text('Reminders'),
          actions: [
            IconButton(
                onPressed: () {
                  context.toView(const SearchView());
                },
                icon: const Icon(Icons.search)),
          ],
          bottom: const TabBar(
              labelColor: kPrimaryColor,
              dividerColor: kPrimaryColor,
              tabs: [
                Text('Soon'),
                Text('Future'),
                Text('Passed'),
              ]),
        ),
        drawer: const CustomDrawer(),
        body: const RemindersViewBody(),
        floatingActionButton: CustomFlaotingActionButton(
          child: const Icon(Icons.add),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const AddReminderAlertDialog();
              },
            );
          },
        ),
      ),
    );
  }
}
