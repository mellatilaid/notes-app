import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState());
  List<NoteModel>? notes;
  fetchAllNotesState() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);

    notes = notesBox.values.toList();
  }
}
