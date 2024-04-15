import 'package:note_app/models/voice_note_model.dart';

class VoiceNotesState {}

class VoiceNotesInitialState extends VoiceNotesState {}

class VoiceNotesSuccussState extends VoiceNotesState {
  final List<VoiceNoteModel> voiceNotes;

  VoiceNotesSuccussState({required this.voiceNotes});
}
