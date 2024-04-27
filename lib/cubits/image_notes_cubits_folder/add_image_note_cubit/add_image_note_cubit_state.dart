part of 'add_image_note_cubit_cubit.dart';

@immutable
sealed class AddImageNoteCubitState {}

final class AddImageNoteInitialState extends AddImageNoteCubitState {}

final class AddImageNoteLoadingState extends AddImageNoteCubitState {}

final class AddImgeNoteSuccusState extends AddImageNoteCubitState {}

final class AddImageNoteFailedState extends AddImageNoteCubitState {
  final String errMessage;
  AddImageNoteFailedState({required this.errMessage});
}
