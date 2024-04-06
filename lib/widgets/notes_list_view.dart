import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_note_enum.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';
import 'package:note_app/widgets/search_view_slidable_note.dart';

import '../models/note_model.dart';

class NotesListView extends StatefulWidget {
  final NotesCubitSource notesCubitSource;
  final List<NoteModel> notes;

  const NotesListView({
    super.key,
    required this.notes,
    required this.notesCubitSource,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  late List<NoteModel> revNotes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    revNotes = widget.notes.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        switch (widget.notesCubitSource) {
          case NotesCubitSource.notesCubit:
            return NotesViewSlidableNote(
              note: widget.notes[index],
              index: index,
            );

          case NotesCubitSource.searchCubit:
            return SearchViewSlidbleNote(
              note: widget.notes[index],
              index: index,
            );
          default:
        }
        return null;
      },
    );
  }
}
