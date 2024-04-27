import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/image_note_model.dart';

part 'add_image_note_cubit_state.dart';

class AddImageNoteCubit extends Cubit<AddImageNoteCubitState> {
  AddImageNoteCubit() : super(AddImageNoteInitialState());

  Future<void> addImageNote({required ImageNoteModel imageNote}) async {
    emit(AddImageNoteLoadingState());

    try {
      var imageNotesBox = Hive.box<ImageNoteModel>(kImageNoteBox);
      await imageNotesBox.add(imageNote);
      emit(AddImageNoteSuccusState());
    } catch (e) {
      AddImageNoteFailedState(errMessage: e.toString());
    }
  }
}
