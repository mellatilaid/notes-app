import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/tasks_list_model.dart';

part 'fetch_tasks_list_state.dart';

class FetchTasksListCubit extends Cubit<FetchTasksListState> {
  FetchTasksListCubit() : super(FetchTasksListInitial());
}
