import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';

import 'add_folder_states.dart';

class AddFolderCubit extends Cubit<AddFolderState> {
  AddFolderCubit() : super(InitialState());

  addFolder({required FolderModel folder}) async {
    emit(AddFolderLoadingState());

    try {
      final foldersBox = Hive.box<FolderModel>(kFoldersBox);
      await foldersBox.add(folder);
      emit(SucussAddFolderState());
    } catch (e) {
      emit(FailureAddFolderState(errMessage: e.toString()));
    }
  }
}
