class AddSubNoteState {}

class InitialState extends AddSubNoteState {}

class SuccussState extends AddSubNoteState {}

class FailureState extends AddSubNoteState {
  final String errMessage;

  FailureState({required this.errMessage});
}

class LoadingState extends AddSubNoteState {}
