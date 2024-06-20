import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/services/local_notifications_service.dart';

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
      _addSheduledNotification(reminderModel: reminderModel);
      emit(AddReminderSuccuss());
    } catch (e) {
      AddReminderFailure(errMessage: e.toString());
    }
  }

  _addSheduledNotification({required ReminderModel reminderModel}) async {
    LocalNotifications().showShuduledNotification(
      id: reminderModel.id,
      title: reminderModel.title,
      payload: reminderModel.id.toString(),
      sheduleDate: DateTime.parse(reminderModel.date),
    );
  }
}
