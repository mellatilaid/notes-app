class VoiceNoteModel {
  final String title;
  final String? content;
  final String voicePath;

  VoiceNoteModel({
    required this.title,
    this.content,
    required this.voicePath,
  });
}
