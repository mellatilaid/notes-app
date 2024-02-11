import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_note_enum.dart';
import 'package:note_app/widgets/custom_sildable_note.dart';

import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;
  final NotesCubitSource notesCubitSource;
  const NotesListView(
      {super.key, required this.notes, required this.notesCubitSource});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesViewSlidableNote(
          notesCubitSource: notesCubitSource,
          note: notes[index],
          index: index,
        );
      },
    );
  }
}
