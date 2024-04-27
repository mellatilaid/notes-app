import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/image_note_model.dart';

part 'image_notes_cubit_state.dart';

class ImageNotesCubit extends Cubit<ImageNotesCubitState> {
  ImageNotesCubit() : super((ImageNotesInitialState()));
  List<ImageNoteModel>? revImageNotes;
  fetchAllImageNotes() {
    final imageNotesBox = Hive.box<ImageNoteModel>(kImageNoteBox);

    final imageNotes = imageNotesBox.values.toList();
    //reverse image notes to display them
    //newest to oldest
    revImageNotes = imageNotes.reversed.toList();
    emit(ImageNotesSucusState(imageNotes: revImageNotes!));
  }
}
