part of 'add_tasks_list_cubit.dart';

@immutable
sealed class AddTasksListState {}

final class AddTasksListInitial extends AddTasksListState {}

final class AddTasksListLoading extends AddTasksListState {}

final class AddTasksListFailure extends AddTasksListState {
  final String errMessage;
  AddTasksListFailure({required this.errMessage});
}

final class AddTasksListSuccuss extends AddTasksListState {}
