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
  //reverce notes list to show notes newest to oldest one
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
      padding: const EdgeInsets.all(8),
      itemCount: revNotes.length,
      itemBuilder: (context, index) {
        return SubNotesViewSlidableNote(
          note: revNotes[index],
          noteIndex: index,
        );
      },
    );
  }
}
