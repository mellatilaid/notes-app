import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/sub_notes_view_slidable_note.dart';

class FolderSubNotesBody extends StatefulWidget {
  final List<NoteModel> notes;
  const FolderSubNotesBody({super.key, required this.notes});

  @override
  State<FolderSubNotesBody> createState() => _FolderSubNotesBodyState();
}

class _FolderSubNotesBodyState extends State<FolderSubNotesBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return SubNotesViewSlidableNote(
          note: widget.notes[index],
          index: index,
        );
      },
    );
  }
}
