import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';

import '../../../helper/const.dart';
import '../../../models/folder_model.dart';

class EditSubNoteCubit extends Cubit {
  EditSubNoteCubit() : super(InitialState());
  int? folderIndex;
  Color? noteColor;
  editSubNote({required index, String? title, String? content}) {
    final folderBox = Hive.box<FolderModel>(kFoldersBox);

    final folder = folderBox.getAt(folderIndex!);

    if (folder != null) {
      final notes = folder.notes;

      final note = notes.elementAt(index);
      note.title = title ?? note.title;
      note.content = title ?? note.title;
      note.color = noteColor?.value ?? note.color;

      notes.insert(index, note);

      folder.notes = notes;
      folder.save();
    }
  }
}
