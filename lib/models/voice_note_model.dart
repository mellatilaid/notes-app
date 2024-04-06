import 'package:hive/hive.dart';

part 'voice_note_model.g.dart';

@HiveType(typeId: 2)
class VoiceNoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? content;
  @HiveField(2)
  final String voicePath;

  VoiceNoteModel({
    required this.title,
    this.content,
    required this.voicePath,
  });
}