import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> implements BaseCubit {
  NotesCubit() : super(InitialState());
  List<NoteModel>? revNotes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kTextNoteBox);
    final List<NoteModel> notes = notesBox.values.toList();

    revNotes = notes.reversed.toList();
    emit(
      NotesSuccuss(
        notes: revNotes!,
      ),
    );
  }

  @override
  addToList({required int index, required var model}) {
    revNotes!.insert(index, model);
    emit(NotesSuccuss(notes: revNotes!, isAdded: true, index: index));
  }

  @override
  removeFromList({required int index}) {
    revNotes!.removeAt(index);
    emit(NotesSuccuss(notes: revNotes!, isDeleted: true, index: index));
  }
}
