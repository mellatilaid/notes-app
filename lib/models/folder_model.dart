import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';

part 'folder_model.g.dart';

@HiveType(typeId: 1)
class FolderModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? coverPath;
  @HiveField(2)
  int color;
  @HiveField(3)
  List<NoteModel> notes;
  @HiveField(4)
  List<FolderModel> folders;

  FolderModel({
    required this.title,
    required this.color,
    required this.folders,
    required this.notes,
    this.coverPath,
  });
}
