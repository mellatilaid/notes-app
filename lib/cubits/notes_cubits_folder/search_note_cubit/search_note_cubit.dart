import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/notes_cubits_folder/search_note_cubit/search_note_state.dart';

import '../../../helper/const.dart';
import '../../../models/note_model.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit() : super(SearchInitialState());
  List<NoteModel>? notes;
  searchNotes(String query) {
    emit(SearchInitialState());

    var notesBox = Hive.box<NoteModel>(kNoteBox);

    List<NoteModel> notesFromBox = notesBox.values.toList();

    if (query.isNotEmpty) {
      notes = notesFromBox.where((note) {
        final noteTitle = note.title.toLowerCase();
        final input = query.toLowerCase();
        return noteTitle.contains(input);
      }).toList();

      emit(SearchSecussState(notes: notes!));
    }
  }

  addToNotes({required int index, required NoteModel note}) {
    notes!.insert(index, note);
    emit(SearchSecussState(notes: notes!));
  }

  removeFromNotes({required int index}) {
    notes!.removeAt(index);
    emit(SearchSecussState(notes: notes!));
  }
}
