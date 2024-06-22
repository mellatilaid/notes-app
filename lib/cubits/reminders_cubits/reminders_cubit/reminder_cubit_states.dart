import 'package:note_app/models/reminder_model.dart';

class RemindersStates {}

final class RemindersInitialState extends RemindersStates {}

class RemindersSuccussState extends RemindersStates {
  final List<ReminderModel> soonReminders;
  final List<ReminderModel> futureReminders;
  final List<ReminderModel> passedReminders;

  RemindersSuccussState(
      {required this.soonReminders,
      required this.futureReminders,
      required this.passedReminders});
}

class RemindersFailureState extends RemindersStates {
  final String message;
  RemindersFailureState({required this.message});
}
