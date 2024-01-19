import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_states.dart';
import 'package:note_app/models/note_model.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteState(isSelected: false));

  bool isNoteSelected = false;
  NoteModel? noteModel;
  set(bool value) {
    isNoteSelected = value;

    emit(DeleteNoteState(isSelected: isNoteSelected));
  }

  deleteNote({required NoteModel note}) {
    isNoteSelected ? note.delete() : '';
  }
}
