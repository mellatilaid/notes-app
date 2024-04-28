import 'package:hive_flutter/adapters.dart';

part 'image_note_model.g.dart';

@HiveType(typeId: 3)
class ImageNoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final String imagePath;
  @HiveField(2)
  String? content;
  @HiveField(3)
  String date;
  ImageNoteModel({
    required this.title,
    this.content,
    required this.imagePath,
    required this.date,
  });
}
