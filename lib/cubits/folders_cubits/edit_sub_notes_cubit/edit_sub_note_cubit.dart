import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_notes_states.dart';
import 'package:note_app/models/note_model.dart';

import '../../../helper/const.dart';
import '../../../models/folder_model.dart';

class EditSubNoteCubit extends Cubit<EditSubNotesState> {
  EditSubNoteCubit() : super(InitialState());
  int? folderIndex;
  int? noteIndex;
  Color? noteColor;
  late NoteModel editedNote;
  late List<NoteModel> notes;
  editSubNote({String? title, String? content}) {
    final folderBox = Hive.box<FolderModel>(kFoldersBox);

    final folder = folderBox.getAt(folderIndex!);

    if (folder != null) {
      notes = folder.notes;

      editedNote = notes.elementAt(noteIndex!);
      setEditedNote(title: title, content: content);

      notes[noteIndex!] = editedNote;

      folder.notes = notes;
      folder.save();
      emit(SuccussState());
    }
  }

  setEditedNote({String? title, String? content}) {
    editedNote.title = title ?? editedNote.title;
    editedNote.content = content ?? editedNote.content;
    editedNote.color = noteColor?.value ?? editedNote.color;
  }
}
