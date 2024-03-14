import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fetch_sub_notes_states.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';

import '../../../helper/const.dart';

class SubNotesCubit extends Cubit<SubNotesState> {
  SubNotesCubit() : super(InitialState());
  Color itemColor = kColors[0];
  fetchSubNotes({required int index}) {
    final folderBox = Hive.box<FolderModel>(kFoldersBox);

    final folder = folderBox.getAt(index);
    if (folder != null) {
      final List<NoteModel> notes = folder.notes;
      emit(SucussState(notes: notes));
    }
  }
}
