import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fetch_sub_notes_states.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';

import '../../../helper/const.dart';

class SubNotesCubit extends Cubit<SubNotesState> {
  SubNotesCubit() : super(InitialState());
  List<NoteModel>? notes;
  Color itemColor = kColors[0];
  int? folderIndex;
  fetchSubNotes() {
    final folderBox = Hive.box<FolderModel>(kFoldersBox);

    final folder = folderBox.getAt(folderIndex!);
    if (folder != null) {
      notes = folder.notes;
      emit(SucussState(notes: notes!));
    }
  }

  addToNotes({required int index, required NoteModel note}) {
    notes!.insert(index, note);
    emit(SucussState(notes: notes!));
  }

  removeFromNotes({required int index}) {
    notes!.removeAt(index);
    emit(SucussState(notes: notes!));
  }
}
