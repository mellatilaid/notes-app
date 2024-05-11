part of 'edit_tasks_list_cubit.dart';

@immutable
sealed class EditTasksListState {}

final class EditTasksListInitial extends EditTasksListState {}

final class EditTasksListSuccusState extends EditTasksListState {}
