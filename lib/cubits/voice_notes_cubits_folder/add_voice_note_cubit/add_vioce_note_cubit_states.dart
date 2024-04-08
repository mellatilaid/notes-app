class AddVoiceNotesState {}

class InitialState extends AddVoiceNotesState {}

class AddVoiceNoteLoading extends AddVoiceNotesState {}

class AddVoiceNoteSuccuss extends AddVoiceNotesState {}

class AddVoiceNoteFailure extends AddVoiceNotesState {
  final String errMessage;
  AddVoiceNoteFailure({required this.errMessage});
}
