import 'package:flutter/material.dart';

import 'custom_text_button.dart';
import 'invisible_text_field.dart';

class AddTaskAlertDialog extends StatefulWidget {
  final Function(String) onAddTask;
  const AddTaskAlertDialog({super.key, required this.onAddTask});

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController _taskTile = TextEditingController();
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
              widget.onAddTask(_taskTile.text);
            }
            Navigator.pop(context);
          },
          width: null,
        ),
      ],
    );
  }
}
