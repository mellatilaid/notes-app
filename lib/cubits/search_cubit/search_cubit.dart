import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/search_cubit/search_state.dart';
import 'package:note_app/helper/enums.dart';
import 'package:note_app/models/image_note_model.dart';
import 'package:note_app/models/voice_note_model.dart';

import '../../helper/const.dart';
import '../../models/note_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());
  List<NoteModel>? notes;
  search(String query, SearchType searchType) {
    List<dynamic> results = [];
    emit(SearchInitialState());

    switch (searchType) {
      case SearchType.notes:
        var notesBox = Hive.box<NoteModel>(kTextNoteBox);
        results = notesBox.values
            .where((note) =>
                note.title.contains(query) || note.content.contains(query))
            .toList();
        results = results as List<NoteModel>;
        break;
      case SearchType.voices:
        var voicesBox = Hive.box<VoiceNoteModel>(kVoiceNoteBox);
        results = voicesBox.values
            .where((note) => note.title.contains(query))
            .toList();
        break;
      case SearchType.images:
        var imagesBox = Hive.box<ImageNoteModel>(kImageNoteBox);
        results = imagesBox.values
            .where((note) => note.title.contains(query))
            .toList();
        break;

      default:
    }
    //emit state baced on results list content
    results.isNotEmpty
        ? emit(SearchSecussState(resualt: results))
        : emit(SearchEmptyState());
  }

  emitEmptyState() {
    emit(SearchEmptyState());
  }
}
