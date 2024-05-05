import 'package:hive/hive.dart';

part 'to_do_item_model.g.dart';

@HiveType(typeId: 4)
class ToDoItemModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  bool isChecked = false;

  ToDoItemModel({this.title, required this.isChecked});
}
