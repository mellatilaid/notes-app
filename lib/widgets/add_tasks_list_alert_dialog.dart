import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/cubit/add_tasks_list_cubit.dart';
import 'package:note_app/widgets/add_tasks_list_alert_dialog_body.dart';

class AddTasksListAlertDialog extends StatelessWidget {
  const AddTasksListAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTasksListCubit(),
      child: const AddTasksListAlertDialogBody(),
    );
  }
}
