import 'package:hive_flutter/adapters.dart';

part 'image_note_model.g.dart';

@HiveType(typeId: 3)
class ImageNoteModel extends HiveObject {
  @HiveField(0)
  final String? imageTitle;
  @HiveField(1)
  final String imagePath;
  @HiveField(2)
  final String? imageContent;
  @HiveField(3)
  final String date;
  ImageNoteModel({
    this.imageTitle,
    this.imageContent,
    required this.imagePath,
    required this.date,
  });
}
