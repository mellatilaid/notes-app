import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color itemColor = kColors[0];
  addNote({required NoteModel note}) async {
    emit(AddNoteLaoding());
    note.color = itemColor.value;
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      if (note.title.isEmpty && note.content.isEmpty) {
        emit(AddNoteEmpty());
      } else {
        await notesBox.add(note);
        emit(AddNoteSuccuss());
      }
    } catch (e) {
      AddNoteFailure(errMessage: e.toString());
    }
  }
}
