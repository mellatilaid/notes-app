class AddReminderState {}

final class AddReminderInitial extends AddReminderState {}

final class AddReminderLoading extends AddReminderState {}

final class AddReminderSuccuss extends AddReminderState {}

final class AddReminderFailure extends AddReminderState {
  final String errMessage;
  AddReminderFailure({required this.errMessage});
}
