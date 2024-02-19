import 'package:note_app/models/note_model.dart';

class FolderModel {
  String title;
  String? coverPath;
  int color;
  List<NoteModel> notes;
  List<FolderModel> folders;

  FolderModel({
    required this.title,
    required this.color,
    required this.folders,
    required this.notes,
    this.coverPath,
  });
}
