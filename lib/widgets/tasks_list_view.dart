import 'package:flutter/material.dart';

import '../models/to_do_item_model.dart';

class TasksListView extends StatefulWidget {
  final List<ToDoItemModel> tasks;
  const TasksListView({super.key, required this.tasks});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: widget.tasks[index].isChecked,
            onChanged: (value) {
              setState(() {
                widget.tasks[index].isChecked = value!;
              });
            },
            title: Text(
              widget.tasks[index].title,
              style: TextStyle(
                decoration: widget.tasks[index].isChecked
                    ? TextDecoration.lineThrough
                    : null,
                decorationColor:
                    widget.tasks[index].isChecked ? Colors.green : null,
                decorationThickness: 3,
              ),
            ),
          );
        });
  }
}
