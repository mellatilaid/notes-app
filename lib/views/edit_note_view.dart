import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Edit Note'),
      ),
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
