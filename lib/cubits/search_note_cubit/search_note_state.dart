import 'package:note_app/models/note_model.dart';

class SearchNoteState {}

class SearchInitialState extends SearchNoteState {}

class SearchSecussState extends SearchNoteState {
  final List<NoteModel> notes;
  SearchSecussState({required this.notes});
}
