import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../../../helper/const.dart';

part 'add_tasks_list_state.dart';

class AddTasksListCubit extends Cubit<AddTasksListState> {
  AddTasksListCubit() : super(AddTasksListInitial());

  Color tasksListColor = kColors[0];
  addTasksList({required TasksListModel tasksListModel}) async {
    emit(AddTasksListLoading());
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);

    tasksListModel.color = tasksListColor.value;

    try {
      await tasksListBox.add(tasksListModel);
      emit(AddTasksListSuccuss());
    } catch (e) {
      log(e.toString());
      emit(AddTasksListFailure(
        errMessage: e.toString(),
      ));
    }
  }
}
