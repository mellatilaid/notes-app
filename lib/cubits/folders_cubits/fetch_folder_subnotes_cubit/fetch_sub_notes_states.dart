import 'package:note_app/models/note_model.dart';

class SubNotesState {}

class InitialState extends SubNotesState {}

class SucussState extends SubNotesState {
  final List<NoteModel> notes;
  SucussState({required this.notes});
}
