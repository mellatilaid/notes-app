import 'package:note_app/models/note_model.dart';

class SearchState {}

class SearchInitialState extends SearchState {}

class SearchSecussState extends SearchState {
  final List<NoteModel> notes;
  SearchSecussState({required this.notes});
}

class SearchFailedState extends SearchState {
  final String errMessage;
  SearchFailedState({required this.errMessage});
}
