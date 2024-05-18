import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';

import '../models/to_do_item_model.dart';
import 'custom_text_button.dart';
import 'invisible_text_field.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({
    super.key,
  });

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController _taskTitle = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskTitle.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: InvisibleTextField(
        focusNode: focusNode,
        controller: _taskTitle,
        hintText: 'Task title',
      ),
      actions: [
        CustomTextButton(
          title: 'Close',
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Colors.grey,
          width: null,
        ),
        CustomTextButton(
          title: 'Save',
          onPressed: () {
            if (_taskTitle.text.isNotEmpty) {
              final EditTasksListCubit editTasksListCubit =
                  context.read<EditTasksListCubit>();

              _addTaskToHive(_taskTitle.text, editTasksListCubit);
            }
            Navigator.pop(context);
          },
          width: null,
        ),
      ],
    );
  }

  //added the new task to local DB list
  void _addTaskToHive(String taskTitle, EditTasksListCubit editTasksListCubit) {
    editTasksListCubit
        .saveNewTaskToTasks(ToDoItemModel(title: taskTitle, isChecked: false));
  }
}
