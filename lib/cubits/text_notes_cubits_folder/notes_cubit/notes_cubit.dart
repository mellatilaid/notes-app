import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/helper/basic_class.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> implements INoteCubit {
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
  addToNotes({required int index, required var note}) {
    revNotes!.insert(index, note);
    emit(NotesSuccuss(notes: revNotes!));
  }

  @override
  removeFromNotes({required int index}) {
    revNotes!.removeAt(index);
    emit(NotesSuccuss(notes: revNotes!));
  }
}
