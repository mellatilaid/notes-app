import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

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
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 20,
          color: Colors.blue,
        );
      },
    );
  }
}
