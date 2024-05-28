import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminder_cubit_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/reminder_model.dart';

class RemindersCubit extends Cubit<RemindersStates> {
  RemindersCubit() : super(RemindersInitialState());

  List<ReminderModel>? revReminders;

  fetchAllNotes() {
    var remindersBox = Hive.box<ReminderModel>(kRemindersBox);
    final List<ReminderModel> reminders = remindersBox.values.toList();

    revReminders = reminders.reversed.toList();
    emit(
      RemindersSuccussState(
        reminders: revReminders!,
      ),
    );
  }
}
