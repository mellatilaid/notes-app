import 'package:note_app/models/note_model.dart';

class NotesState {}

class InitialState extends NotesState {}

class NotesSuccuss extends NotesState {
  final List<NoteModel> notes;
  final bool? isDeleted;
  final bool? isAdded;
  final int? index;

  NotesSuccuss({required this.notes, this.isAdded, this.isDeleted, this.index});
}
