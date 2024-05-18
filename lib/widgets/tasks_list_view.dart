import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
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
    if (widget.tasks.isNotEmpty) {
      return ReorderableListView(
        children: List.generate(widget.tasks.length, (index) {
          return SlidabletoDoItem(
            key: ValueKey(index),
            taskIndex: index,
            task: widget.tasks[index],
            onTaskDelete: deleteTask,
          );
        }),
        onReorder: (oldIndex, newIndex) {
          BlocProvider.of<EditTasksListCubit>(context)
              .updateTasks(oldIndex, newIndex);
        },
      );
    } else {
      return const CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: false,
        onChanged: null,
        title: Text('add task'),
      );
    }
  }

  deleteTask(int taskIndex) {
    setState(() {
      widget.tasks.removeAt(taskIndex);
    });
  }
}
/*ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (context, index) {
            return SlidabletoDoItem(
              taskIndex: index,
              task: widget.tasks[index],
              onTaskDelete: deleteTask,
            );
          })*/