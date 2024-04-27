import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_image_note_cubit_state.dart';

class AddImageNoteCubitCubit extends Cubit<AddImageNoteCubitState> {
  AddImageNoteCubitCubit() : super(AddImageNoteInitialState());
}
