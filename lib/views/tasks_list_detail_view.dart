import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/services/local_notifications_service.dart';
import 'package:note_app/widgets/add_tasks_reminder_alert_dialog.dart';
import 'package:note_app/widgets/app_bar_icon_button.dart';
import 'package:note_app/widgets/simple_alert_dialag_message.dart';

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
    //fetch tasks list from edit tasks list cubit
    //because it is responsible for editing it
    //it should have the aiginal takss list first
    editTasksListCubit.getExistingTasks();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //check if the new tasks list is empty before saving it
        //if yes then can't be saved
        if (editTasksListCubit.checkTasksLength()) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialaugMessage(
                  content: "Empty Tasks list can't be saved");
            },
          );
          return true;
        }
        _saveChangesToHive();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          actions: [
            AppBarIconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AddTasksReminderAlertDialog(
                      tasksListModel: widget.tasksList,
                    );
                  },
                );
              },
              icon: Icons.alarm,
            ),
            AppBarIconButton(
              onPressed: () {
                _deleteTasksList();
              },
              icon: Icons.delete_outline,
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
  void _saveChangesToHive() {
    editTasksListCubit.saveChangesToHive();
    fetchTasksListCubit.fetchAllTasksLists();
  }

  _deleteTasksList() {
    LocalNotifications().cancelNotification(widget.tasksList.id);
    widget.tasksList.delete();
    Navigator.pop(context);

    fetchTasksListCubit.fetchAllTasksLists();
  }
}
