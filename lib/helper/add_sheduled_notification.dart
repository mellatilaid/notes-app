import 'dart:convert';

import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/services/local_notifications_service.dart';

addSheduledNotification(
    {required ReminderModel reminderModel,
    required String notificationSource}) async {
  LocalNotifications().showShuduledNotification(
    id: reminderModel.id,
    title: reminderModel.title,
    payload: jsonEncode({'screen': notificationSource, 'id': reminderModel.id}),
    sheduleDate: DateTime.parse(reminderModel.date),
  );
}
