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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.lock_open_outlined),
          ),
        ],
      ),
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
