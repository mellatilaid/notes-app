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
  State<TasksListDetailView> createState() => TasksListDetailViewState();
}

class TasksListDetailViewState extends State<TasksListDetailView> {
  late List<ToDoItemModel> tasks;
  String? title;
  late FetchTasksListCubit fetchTasksListCubit;
  late EditTasksListCubit editTasksListCubit;

  @override
  void initState() {
    super.initState();
    tasks = widget.tasksList.tasksList;
    title = widget.tasksList.title;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //giving the 2 cubit variable there cubit befor diposing this widget
        //to let the saveChangesToHive to do its job correcty
        editTasksListCubit = context.read<EditTasksListCubit>();
        fetchTasksListCubit = context.read<FetchTasksListCubit>();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: TasksListDetailViewBody(
          onSaveChnged: onTasksUpdated,
          tasksList: widget.tasksList,
          onTitleChanged: onTitleUpdated,
        ),
      ),
    );
  }

//called whenever a new task added to tasks list
//in add task alert dialog widget
  onTasksUpdated(List<ToDoItemModel> toDoItems) {
    tasks = toDoItems;
  }

  //called when the child wiget disposed
  //to take the updated title
  onTitleUpdated(String toDoTitle) {
    title = toDoTitle;

    saveChangesToHive();
  }

  //save changes title/tasks to hive DB
  saveChangesToHive() {
    log(title ?? 'title is null');
    editTasksListCubit.saveEdit(tasks: tasks, title: title);
    fetchTasksListCubit.fetchAllTasksLists();
  }
}
