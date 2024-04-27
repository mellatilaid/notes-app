import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/image_note_model.dart';

part 'image_notes_cubit_state.dart';

class ImageNotesCubitCubit extends Cubit<ImageNotesCubitState> {
  ImageNotesCubitCubit() : super((ImageNotesInitialState()));
}
