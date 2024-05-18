import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';

import '../../../helper/const.dart';

part 'edit_tasks_list_state.dart';

// Cubit for editing a list of tasks.
class EditTasksListCubit extends Cubit<EditTasksListState> {
  // Constructor initializes the state to EditTasksListInitial.
  EditTasksListCubit() : super(EditTasksListInitial());

  // Index to display the list of tasks.
  int? displayListIndex;
  // Title of the task list.
  String? title;
  // List of tasks.
  List<ToDoItemModel> tasks = [];

  // Method to retrieve existing tasks.
  void getExistingTasks() {
    try {
      final listOfTasks = getTasksList();
      tasks = listOfTasks.tasksList;
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      // Consider handling the exception more gracefully.
      throw Exception(e.toString());
    }
  }

  // Method to save a new task to the list.
  void saveNewTaskToTasks(ToDoItemModel task) {
    try {
      tasks.insert(0, task);
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      // Consider handling the exception more gracefully.
      throw Exception(e.toString());
    }
  }

  // Method to update the tasks list with a new order.
  void updateTasks(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final ToDoItemModel task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    emit(EditTasksListSuccusState(tasks: tasks));
  }

  // Method to get the list of tasks from Hive database.
  TasksListModel getTasksList() {
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);
    final tasksLists = tasksListBox.values.toList();
    // Corrects the index of the tasks list.
    final actualIndex = tasksLists.length - 1 - displayListIndex!;
    return tasksLists[actualIndex];
  }

  // Method to change the title of the task list.
  void changeTitle(String? newTitle) {
    title = newTitle;
  }

  // Method to delete a task from the list.
  void deleteTaskFromTasks({required int taskIndex}) {
    try {
      tasks.removeAt(taskIndex);
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  // Method to check if the tasks list is empty.
  bool checkTasksLength() {
    return tasks.isEmpty;
  }

  // Method to save changes to the Hive database.
  void saveChangesToHive() {
    try {
      final listOfTasks = getTasksList();
      listOfTasks.tasksList = tasks;
      if (title != null) listOfTasks.title = title;
      listOfTasks.save();
    } catch (e) {
      // Consider handling the exception more gracefully.
      throw Exception(e.toString());
    }
  }
}
