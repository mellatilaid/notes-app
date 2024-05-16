import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';

import '../../../helper/const.dart';

part 'edit_tasks_list_state.dart';

class EditTasksListCubit extends Cubit<EditTasksListState> {
  EditTasksListCubit() : super(EditTasksListInitial());
  int? displayListIndex;
  String? title;
  List<ToDoItemModel> tasks = [];
  bool isTitleChanged = false;

  getExistingTasks() {
    try {
      final listOfTasks = getTasksList();

      tasks = listOfTasks.tasksList;
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  saveNewTaskToLocal(ToDoItemModel task) {
    try {
      final listOfTasks = getTasksList();

      listOfTasks.tasksList.insert(0, task);
      listOfTasks.save();
      tasks = listOfTasks.tasksList;
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  saveTitleChangesToLocal() {
    try {
      final tasksList = getTasksList();
      if (isTitleChanged) {
        tasksList.title = title;
        _resetTitle();
      }

      tasksList.save();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  TasksListModel getTasksList() {
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);
    final tasksLists = tasksListBox.values.toList();
    /*gets the correct index of the tasks list because 
    tasks lists is reversed in fetch tasks lists cubit*/
    final actaulIndex = tasksLists.length - 1 - displayListIndex!;
    TasksListModel listOfTasks = tasksLists[actaulIndex];
    return listOfTasks;
  }

  changeTitle(String? newTitle) {
    title = newTitle;
    isTitleChanged = true;
  }

  _resetTitle() {
    title = null;
    isTitleChanged = false;
  }

  deleteTaskFromLocal({required int taskIndex}) {
    try {
      final listOfTasks = getTasksList();

      listOfTasks.tasksList.removeAt(taskIndex);

      listOfTasks.save();
      tasks = listOfTasks.tasksList;
      emit(EditTasksListSuccusState(tasks: tasks));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  bool checkTasksLength() {
    return (tasks.isEmpty) ? true : false;
  }
}
