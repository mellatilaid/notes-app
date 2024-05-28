import 'package:note_app/models/reminder_model.dart';

class RemindersStates {}

final class RemindersInitialState extends RemindersStates {}

class RemindersSuccussState extends RemindersStates {
  final List<ReminderModel> reminders;
  RemindersSuccussState({required this.reminders});
}

class RemindersFailureState extends RemindersStates {
  final String message;
  RemindersFailureState({required this.message});
}
