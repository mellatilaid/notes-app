import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/models/tasks_list_model.dart';

import '../../../helper/const.dart';

part 'fetch_tasks_list_state.dart';

class FetchTasksListCubit extends Cubit<FetchTasksListState>
    implements BaseNoteCubit {
  FetchTasksListCubit() : super(FetchTasksListInitial());
  List<TasksListModel>? revTasksLists;
  fetchAllTasksLists() {
    final tasksListBox = Hive.box<TasksListModel>(kTasksListBox);

    final List<TasksListModel> tasksLists = tasksListBox.values.toList();

    revTasksLists = tasksLists.reversed.toList();
    emit(FetchTasksListSuccuss(tasksList: revTasksLists!));
  }

  @override
  addToNotes({required int index, required model}) {
    revTasksLists!.insert(index, model);
  }

  @override
  removeFromNotes({required int index}) {
    revTasksLists!.removeAt(index);
  }
}
