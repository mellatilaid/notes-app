import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/add_tasks_list_alert_dialog_body.dart';

import '../cubits/tasks_lists_cubits/add_tasks_list_cubit/add_tasks_list_cubit.dart';

class AddTasksListAlertDialog extends StatelessWidget {
  const AddTasksListAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTasksListCubit(),
      child: BlocListener<AddTasksListCubit, AddTasksListState>(
        listener: (context, state) {
          if (state is AddTasksListSuccuss) {
            Navigator.pop(context);
          } else if (state is AddTasksListFailure) {
            if (kDebugMode) {
              debugPrint('oops there was a problem ${state.errMessage}');
            }
          }
        },
        child: const AddTasksListAlertDialogBody(),
      ),
    );
  }
}
