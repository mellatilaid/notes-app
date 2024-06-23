import 'package:note_app/models/reminder_model.dart';
import 'package:note_app/services/local_notifications_service.dart';

addSheduledNotification({required ReminderModel reminderModel}) async {
  LocalNotifications().showShuduledNotification(
    id: reminderModel.id,
    title: reminderModel.title,
    payload: reminderModel.id.toString(),
    sheduleDate: DateTime.parse(reminderModel.date),
  );
}
