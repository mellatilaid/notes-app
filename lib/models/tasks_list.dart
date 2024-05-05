import 'package:hive/hive.dart';
import 'package:note_app/models/to_do_item_model.dart';

part 'tasks_list.g.dart';

@HiveType(typeId: 5)
class TasksList extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  List<ToDoItemModel> tasksList;
  @HiveField(2)
  int color;
  @HiveField(3)
  String date;

  TasksList({
    this.title,
    required this.tasksList,
    required this.color,
    required this.date,
  });
}
