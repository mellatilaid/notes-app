import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_states.dart';
import 'package:note_app/models/note_model.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteState(isSelected: false));

  bool _isNoteSelected = false;
  int selectedNoteIndex = -1;
  NoteModel? noteModel;
  set(bool value) {
    _isNoteSelected = value;

    emit(
      DeleteNoteState(
        isSelected: _isNoteSelected,
      ),
    );
  }

  deleteNote({required NoteModel note}) {
    _isNoteSelected ? note.delete() : '';
  }
}
