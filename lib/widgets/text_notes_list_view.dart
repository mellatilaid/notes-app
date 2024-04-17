import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_note_enums.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';
import 'package:note_app/widgets/search_view_slidable_note.dart';

import '../models/note_model.dart';

class TextNotesListview extends StatefulWidget {
  final NotesCubitSource notesCubitSource;
  final List<NoteModel> textNotes;

  const TextNotesListview({
    super.key,
    required this.textNotes,
    required this.notesCubitSource,
  });

  @override
  State<TextNotesListview> createState() => _TextNotesListviewState();
}

class _TextNotesListviewState extends State<TextNotesListview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: widget.textNotes.length,
      itemBuilder: (context, index) {
        switch (widget.notesCubitSource) {
          case NotesCubitSource.notesCubit:
            return NotesViewSlidableNote(
              widgetLocation: WidgetLocation.textNotesViewBody,
              noteModel: widget.textNotes[index],
              index: index,
            );

          case NotesCubitSource.searchCubit:
            return SearchViewSlidbleNote(
              note: widget.textNotes[index],
              index: index,
            );
          default:
        }
        return null;
      },
    );
  }
}
