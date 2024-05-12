import 'package:flutter/material.dart';

import '../models/to_do_item_model.dart';
import 'custom_text_button.dart';
import 'invisible_text_field.dart';

class AddTaskAlertDialog extends StatefulWidget {
  final List<ToDoItemModel> tasks;
  final String title;
  final Function(String) onAddTask;
  final Function(List<ToDoItemModel> toDoItems) onSaveChnged;
  const AddTaskAlertDialog({
    super.key,
    required this.onAddTask,
    required this.tasks,
    required this.title,
    required this.onSaveChnged,
  });

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController _taskTile = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late List<ToDoItemModel> updatedTasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
    updatedTasks = widget.tasks;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskTile.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: InvisibleTextField(
        focusNode: focusNode,
        controller: _taskTile,
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
            if (_taskTile.text.isNotEmpty) {
              //callback to display new task in immiedtly in tasks
              //without saving it to hive
              widget.onAddTask(_taskTile.text);
              //add the new task to updated tasks
              //befor adding it to hive
              _addTask(_taskTile.text);
              //callback to add new tasks to hive

              widget.onSaveChnged(updatedTasks);
            }
            Navigator.pop(context);
          },
          width: null,
        ),
      ],
    );
  }

  //added the new task to updatedTasks list
  void _addTask(String taskTitle) {
    setState(() {
      updatedTasks.insert(0, ToDoItemModel(title: taskTitle, isChecked: false));
    });
  }
}
