import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/folders_cubits/add_sub_note_cubit/add_sub_note_states.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';

class AddSubNoteCubit extends Cubit<AddSubNoteState> {
  AddSubNoteCubit() : super(InitialState());
  int? folderIndex;
  Color subNoteColor = kColors[0];
  addSubNote({required NoteModel note}) async {
    emit(LoadingState());
    final foldersBox = Hive.box<FolderModel>(kFoldersBox);

    final folder = foldersBox.getAt(folderIndex!);

    if (folder != null) {
      note.color = subNoteColor.value;
      folder.notes.insert(0, note);
      try {
        await foldersBox.put(folder.key, folder);
        emit(SuccussState());
      } catch (e) {
        emit(FailureState(errMessage: e.toString()));
      }
    } else {
      emit(
        FailureState(errMessage: 'i did not find the folder in the box'),
      );
    }
  }
}
