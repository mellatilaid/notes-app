import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_sildable_note.dart';

import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;
  const NotesListView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return CustomSlidableNote(
          note: notes[index],
          index: index,
        );
      },
    );
  }
}
