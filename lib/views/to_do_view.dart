import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_floating_action_button.dart';
import 'package:note_app/widgets/to_do_view_body.dart';

import '../widgets/to_do_alert_dialog_body.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My To Dos'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const ToDoViewBody(),
      floatingActionButton: CustomFlaotingActionButton(
        child: const Icon(Icons.add),
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const ToDoAlertDialogBody();
            },
          );
        },
      ),
    );
  }
}
