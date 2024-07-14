import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/reminders_cubits/reminders_cubit/reminder_cubit_states.dart';
import 'package:note_app/event/event_bus.dart';
import 'package:note_app/event/reminder_triggred_event.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/models/reminder_model.dart';

class RemindersCubit extends Cubit<RemindersStates> implements BaseCubit {
  RemindersCubit() : super(RemindersInitialState()) {
    eventBus.on<ReminderTriggredEvent>().listen((event) {
      _moveReminderToPassed(event.reminderID);
    });
  }

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
  addToList(
      {required int index, required model, ReminderSource? reminderSource}) {
    switch (reminderSource) {
      case ReminderSource.soonReminders:
        soonReminders.insert(index, model);
        break;
      case ReminderSource.futureReminders:
        futureReminders.insert(index, model);
        break;
      case ReminderSource.passedReminders:
        passedReminders.insert(index, model);
        break;
      default:
    }
    //revReminders!.insert(index, model);
    emit(RemindersSuccussState(
      soonReminders: soonReminders,
      futureReminders: futureReminders,
      passedReminders: passedReminders,
    ));
  }

  @override
  removeFromList({required int index, ReminderSource? reminderSource}) {
    //revReminders!.removeAt(index);
    switch (reminderSource) {
      case ReminderSource.soonReminders:
        soonReminders.removeAt(index);
        break;
      case ReminderSource.futureReminders:
        futureReminders.removeAt(index);
        break;
      case ReminderSource.passedReminders:
        passedReminders.removeAt(index);
        break;
      default:
    }
    emit(RemindersSuccussState(
      soonReminders: soonReminders,
      futureReminders: futureReminders,
      passedReminders: passedReminders,
    ));
  }

  void seperateReminderList() {
    final now = DateTime.now();
    for (var reminder in revReminders!) {
      final reminderDate = DateTime.parse(reminder.date);

      if (reminderDate.isAfter(DateTime.now())) {
        if (reminderDate.year > now.year ||
            (reminderDate.year == now.year && reminderDate.month > now.month) ||
            (reminderDate.year == now.year &&
                reminderDate.month == now.month &&
                reminderDate.day > now.day)) {
          futureReminders.add(reminder);
        } else if (reminderDate.year == now.year &&
            reminderDate.month == now.month &&
            reminderDate.day == now.day) {
          soonReminders.add(reminder);
        }
      } else {
        passedReminders.add(reminder);
      }
    }
  }

  void _moveReminderToPassed(int reminderId) {
    // Find and remove the reminder from soon or future lists
    ReminderModel? movedReminder;
    movedReminder =
        soonReminders.firstWhere((reminder) => reminder.id == reminderId,
            orElse: () => futureReminders.firstWhere(
                  (reminder) => reminder.id == reminderId,
                ));

    soonReminders.remove(movedReminder);

    // Add the reminder to passed reminders
    passedReminders.insert(0, movedReminder);

    // Emit the updated state
    emit(RemindersSuccussState(
      soonReminders: soonReminders,
      futureReminders: futureReminders,
      passedReminders: passedReminders,
    ));
  }
}
