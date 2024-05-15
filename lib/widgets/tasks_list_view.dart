import 'package:flutter/material.dart';
import 'package:note_app/widgets/slidable_to_do_item.dart';

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
          return SlidabletoDoItem(
            taskIndex: index,
            task: widget.tasks[index],
            onTaskDelete: deleteTask,
          );
        });
  }

  deleteTask(int taskIndex) {
    setState(() {
      widget.tasks.removeAt(taskIndex);
    });
  }
}
