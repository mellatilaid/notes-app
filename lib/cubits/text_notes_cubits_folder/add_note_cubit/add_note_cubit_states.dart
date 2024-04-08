class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccuss extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;
  AddNoteFailure({required this.errMessage});
}

class AddNoteEmpty extends AddNoteState {}

class AddNoteLaoding extends AddNoteState {}
