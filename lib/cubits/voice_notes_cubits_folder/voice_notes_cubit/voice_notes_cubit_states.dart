import 'package:note_app/models/voice_note_model.dart';

class VoiceNotes {}

class VoiceNotesInitialState extends VoiceNotes {}

class VoiceNotesSuccussState extends VoiceNotes {
  final List<VoiceNoteModel> voiceNotes;

  VoiceNotesSuccussState({required this.voiceNotes});
}
