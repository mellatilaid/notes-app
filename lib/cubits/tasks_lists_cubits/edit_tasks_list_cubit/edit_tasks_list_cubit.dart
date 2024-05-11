import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/tasks_list_model.dart';
import 'package:note_app/models/to_do_item_model.dart';

import '../../../helper/const.dart';

part 'edit_tasks_list_state.dart';

class EditTasksListCubit extends Cubit<EditTasksListState> {
  EditTasksListCubit() : super(EditTasksListInitial());
  int? tasksListIndex;

  saveEdit({required List<ToDoItemModel> tasks, String? title}) {
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);

    final tasksList = tasksListBox.getAt(tasksListIndex!);

    if (tasksList != null) {
      tasksList.tasksList = tasks;
      tasksList.title = title ?? tasksList.title;
      tasksList.save();
      emit(EditTasksListSuccusState());
    }
  }
}
