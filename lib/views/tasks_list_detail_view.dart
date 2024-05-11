import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../widgets/tasks_list_detail_view_body.dart';

class TasksListDetailView extends StatelessWidget {
  final TasksListModel tasksList;
  const TasksListDetailView({super.key, required this.tasksList});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('hello');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: TasksListDetailViewBody(
          tasksList: tasksList,
        ),
      ),
    );
  }
}
