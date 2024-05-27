import 'package:note_app/models/note_model.dart';

import '../models/image_note_model.dart';
import '../models/voice_note_model.dart';
import 'date_time_to_ string.dart';

class AssembleNote {
  ImageNoteModel assembleImageNoteEntry({
    required String imagePath,
    required String title,
    required String content,
  }) {
    return ImageNoteModel(
      imagePath: imagePath,
      title: title,
      content: content,
      date: DateTimeToString().dateToString(time: DateTime.now()),
    );
  }

  VoiceNoteModel assembleVoiceNote(
      {required String audioPath, required String audioTitle}) {
    final VoiceNoteModel voiceNote = VoiceNoteModel(
      title: audioTitle,
      voicePath: audioPath,
      date: DateTimeToString().dateToString(
        time: DateTime.now(),
      ),
    );
    return voiceNote;
  }

  NoteModel assembleTextNote(
      {required String title, required String content, required int color}) {
    return NoteModel(
      title: title,
      content: content,
      date: DateTimeToString().dateToString(time: DateTime.now()),
      color: color,
    );
  }
}
