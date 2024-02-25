import 'package:note_app/models/folder_model.dart';

class FolderState {}

class FoldersInitialState extends FolderState {}

class FoldersSucussState extends FolderState {
  final List<FolderModel> folders;
  FoldersSucussState({required this.folders});
}
