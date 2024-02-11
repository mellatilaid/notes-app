import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_note_enum.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';
import 'package:note_app/widgets/search_view_slidable_note.dart';

import '../models/note_model.dart';

class NotesListView extends StatelessWidget {
  final NotesCubitSource notesCubitSource;
  final List<NoteModel> notes;

  const NotesListView({
    super.key,
    required this.notes,
    required this.notesCubitSource,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        switch (notesCubitSource) {
          case NotesCubitSource.notesCubit:
            return NotesViewSlidableNote(
              note: notes[index],
              index: index,
            );

          case NotesCubitSource.searchCubit:
            return SearchViewSlidbleNote(
              note: notes[index],
              index: index,
            );
          default:
        }
        return null;
      },
    );
  }
}
