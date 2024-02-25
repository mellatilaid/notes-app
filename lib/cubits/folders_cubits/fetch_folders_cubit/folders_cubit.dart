import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/folder_model.dart';

import 'folders_cubit_states.dart';

class FoldersCubit extends Cubit<FolderState> {
  FoldersCubit() : super(FoldersInitialState());
  List<FolderModel>? folders;
  fetchAllFolders() {
    final folderBox = Hive.box<FolderModel>(kFoldersBox);

    folders = folderBox.values.toList();
    emit(FoldersSucussState(folders: folders!));
  }
}
