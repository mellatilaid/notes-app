part of 'image_notes_cubit_cubit.dart';

sealed class ImageNotesCubitState {}

final class ImageNotesInitialState extends ImageNotesCubitState {}

final class ImageNotesSucusState extends ImageNotesCubitState {
  final List<ImageNoteModel> imageNotes;
  ImageNotesSucusState({required this.imageNotes});
}
