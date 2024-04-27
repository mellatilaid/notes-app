import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_notes_cubit_state.dart';

class ImageNotesCubitCubit extends Cubit<ImageNotesCubitState> {
  ImageNotesCubitCubit() : super(ImageNotesCubitInitial());
}
