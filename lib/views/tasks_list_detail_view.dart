import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/tasks_list_model.dart';

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
  late FetchTasksListCubit fetchTasksListCubit;
  late EditTasksListCubit editTasksListCubit;

  @override
  void initState() {
    super.initState();

    editTasksListCubit = context.read<EditTasksListCubit>();
    fetchTasksListCubit = context.read<FetchTasksListCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveTitleChangesToHive();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                _deleteTasksList();
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
        body: TasksListDetailViewBody(
          tasksList: widget.tasksList,
        ),
      ),
    );
  }

  //save title changes to hive
  //when navigating back
  void saveTitleChangesToHive() {
    editTasksListCubit.saveTitleChangesToLocal();
    fetchTasksListCubit.fetchAllTasksLists();
  }

  _deleteTasksList() {
    widget.tasksList.delete();
    Navigator.pop(context);

    fetchTasksListCubit.fetchAllTasksLists();
  }
}
