import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/reminder_model.dart';

import 'add_reminder_cubit_states.dart';

class AddReminderCubit extends Cubit<AddReminderState> {
  AddReminderCubit() : super(AddReminderInitial());
  Color reminderColor = kColors[0];
  addReminder({required ReminderModel reminderModel}) async {
    emit(AddReminderLoading());

    try {
      var remindersBox = Hive.box<ReminderModel>(kRemindersBox);
      reminderModel.color = reminderColor.value;
      await remindersBox.add(reminderModel);
      emit(AddReminderSuccuss());
    } catch (e) {
      AddReminderFailure(errMessage: e.toString());
    }
  }
}
