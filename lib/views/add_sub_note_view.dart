import 'package:flutter/material.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/widgets/add_sub_note_view_body.dart';

class AddSubNoteView extends StatelessWidget {
  final FolderModel folder;

  const AddSubNoteView({
    super.key,
    required this.folder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Note'),
      ),
      body: AddSubNoteViewBody(
        folder: folder,
      ),
    );
  }
}
