import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../../../helper/const.dart';

part 'fetch_tasks_list_state.dart';

class FetchTasksListCubit extends Cubit<FetchTasksListState> {
  FetchTasksListCubit() : super(FetchTasksListInitial());

  fetchAllTasksLists() {
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);

    final List<TasksListModel> tasksList = tasksListBox.values.toList();
    emit(FetchTasksListSuccuss(tasksList: tasksList));
  }
}
