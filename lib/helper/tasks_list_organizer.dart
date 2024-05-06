import 'package:flutter/material.dart';

import '../models/tasks_list_model.dart';
import '../models/to_do_item_model.dart';
import 'note_added_time_formater.dart';

class TasksListOrganize {
  // Function to create a single ToDo item
  ToDoItemModel _createToDoItem(String title) {
    return ToDoItemModel(title: title, isChecked: false);
  }

// Function to assemble the tasks list
  List<ToDoItemModel> _assembleTasksList(List<String> toDoItems) {
    List<ToDoItemModel> tasksList = [];
    for (var item in toDoItems) {
      tasksList.add(_createToDoItem(item));
    }
    return tasksList;
  }

// Function to create the tasks list model
  TasksListModel createTasksListModel(
      {required List<String> toDoItems, String? title}) {
    final List<ToDoItemModel> tasksList = _assembleTasksList(toDoItems);
    return TasksListModel(
      title: title,
      tasksList: tasksList,
      color: Colors.blue.value,
      date: noteFormatDate(time: DateTime.now()),
    );
  }
}
