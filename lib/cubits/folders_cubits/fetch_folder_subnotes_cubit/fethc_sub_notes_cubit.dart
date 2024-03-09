import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fetch_sub_notes_states.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';

class SubNotesCubit extends Cubit<SubNotesState> {
  SubNotesCubit() : super(InitialState());

  fetchSubNotes({required FolderModel folder}) {
    final List<NoteModel> notes = folder.notes;

    emit(SucussState(notes: notes));
  }
}
