part of 'fetch_tasks_list_cubit.dart';

@immutable
sealed class FetchTasksListState {}

final class FetchTasksListInitial extends FetchTasksListState {}

final class FetchTasksListSuccuss extends FetchTasksListState {
  final List<TasksListModel> tasksList;
  FetchTasksListSuccuss({required this.tasksList});
}
