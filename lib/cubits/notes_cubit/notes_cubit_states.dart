import 'package:note_app/models/note_model.dart';

class NotesState {}

class InitialState extends NotesState {}

class NotesSuccuss extends NotesState {
  final List<NoteModel> notes;
  NotesSuccuss({required this.notes});
}
