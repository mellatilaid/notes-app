import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';

class EditSubNoteCubit extends Cubit {
  EditSubNoteCubit() : super(InitialState());

  editSubNote(
      {required index, required String title, required String content}) {}
}
