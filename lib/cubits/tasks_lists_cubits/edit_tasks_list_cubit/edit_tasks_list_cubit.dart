import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_tasks_list_state.dart';

class EditTasksListCubit extends Cubit<EditTasksListState> {
  EditTasksListCubit() : super(EditTasksListInitial());
}
