import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/notes_cubits_folder/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(InitialState());
  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);

    notes = notesBox.values.toList();
    emit(NotesSuccuss(
      notes: notes!,
    ));
  }

  addToNotes({required int index, required NoteModel note}) {
    notes!.insert(index, note);
    emit(NotesSuccuss(notes: notes!));
  }

  removeFromNotes({required int index}) {
    notes!.removeAt(index);
    emit(NotesSuccuss(notes: notes!));
  }
}
