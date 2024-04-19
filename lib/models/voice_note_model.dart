import 'package:hive/hive.dart';

part 'voice_note_model.g.dart';

@HiveType(typeId: 2)
class VoiceNoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final String? content;
  @HiveField(2)
  final String voicePath;
  @HiveField(3)
  final String? date;

  VoiceNoteModel({
    required this.title,
    this.content,
    required this.voicePath,
    this.date,
  });
}
