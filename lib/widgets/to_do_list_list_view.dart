import 'package:flutter/material.dart';
import 'package:note_app/widgets/slidable_task.dart';

import '../models/tasks_list_model.dart';

class ToDoListListView extends StatelessWidget {
  final List<TasksListModel> tasksLists;
  const ToDoListListView({super.key, required this.tasksLists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: tasksLists.length,
      itemBuilder: (context, index) {
        return SlidableTaskList(
          tasksListModel: tasksLists[index],
          index: index,
        );
      },
    );
  }
}
