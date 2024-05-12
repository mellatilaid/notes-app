import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';

import '../cubits/tasks_lists_cubits/edit_tasks_list_cubit/edit_tasks_list_cubit.dart';
import '../cubits/tasks_lists_cubits/fetch_tasks_list_cubit/fetch_tasks_list_cubit.dart';
import '../widgets/tasks_list_detail_view_body.dart';

class TasksListDetailView extends StatefulWidget {
  final TasksListModel tasksList;
  const TasksListDetailView({super.key, required this.tasksList});

  @override
  State<TasksListDetailView> createState() => _TasksListDetailViewState();
}

class _TasksListDetailViewState extends State<TasksListDetailView> {
  late List<ToDoItemModel> tasks;
  String? title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = widget.tasksList.tasksList;
    title = widget.tasksList.title;
  }

  final GlobalKey<TasksListDetailViewBodyState>
      tasksListDetailViewBodyStateKey = GlobalKey();

  getUpdatedTasks(List<ToDoItemModel> toDoItems, String toDoItemsTitle) {
    setState(() {
      tasks = toDoItems;
      title = toDoItemsTitle;
    });
    log(title ?? 'title is empty');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<EditTasksListCubit>(context)
            .saveEdit(tasks: tasks, title: title);
        BlocProvider.of<FetchTasksListCubit>(context).fetchAllTasksLists();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: TasksListDetailViewBody(
          onSaveChnged: getUpdatedTasks,
          tasksList: widget.tasksList,
        ),
      ),
    );
  }
}
