import 'package:note_app/models/note_model.dart';

class NotesState {}

class InitialState extends NotesState {}

class NotesSuccuss extends NotesState {
  final List<NoteModel> notes;
  final bool isAbsorbing;
  NotesSuccuss({required this.notes, this.isAbsorbing = false});
}
