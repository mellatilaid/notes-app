import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 6)
class ReminderModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String date;

  ReminderModel({required this.id, required this.title, required this.date});
}
