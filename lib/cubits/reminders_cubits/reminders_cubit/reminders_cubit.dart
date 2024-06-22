import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminder_cubit_states.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/reminder_model.dart';

class RemindersCubit extends Cubit<RemindersStates> implements BaseCubit {
  RemindersCubit() : super(RemindersInitialState());

  List<ReminderModel>? revReminders;
  List<ReminderModel> soonReminders = [];
  List<ReminderModel> futureReminders = [];
  List<ReminderModel> passedReminders = [];
  fetchAllNotes() {
    var remindersBox = Hive.box<ReminderModel>(kRemindersBox);
    final List<ReminderModel> reminders = remindersBox.values.toList();

    revReminders = reminders.reversed.toList();
    soonReminders.clear();
    futureReminders.clear();
    passedReminders.clear();
    seperateReminderList();
    log(passedReminders.length.toString());
    emit(
      RemindersSuccussState(
        soonReminders: soonReminders,
        futureReminders: futureReminders,
        passedReminders: passedReminders,
      ),
    );
  }

  @override
  addToList({required int index, required model}) {
    revReminders!.insert(index, model);
    emit(RemindersSuccussState(
      soonReminders: soonReminders,
      futureReminders: futureReminders,
      passedReminders: passedReminders,
    ));
  }

  @override
  removeFromList({required int index}) {
    revReminders!.removeAt(index);
    emit(RemindersSuccussState(
      soonReminders: soonReminders,
      futureReminders: futureReminders,
      passedReminders: passedReminders,
    ));
  }

  void seperateReminderList() {
    for (var reminder in revReminders!) {
      final date = DateTime.parse(reminder.date);
      if (date.day == DateTime.now().day && date.hour > DateTime.now().hour) {
        soonReminders.add(reminder);
      } else if (date.day > DateTime.now().day) {
        futureReminders.add(reminder);
      } else {
        passedReminders.add(reminder);
      }
    }
  }
}
