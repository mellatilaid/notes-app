import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import '../widgets/edit_note_view_body.dart';

class EditNoteView extends StatefulWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              _deleteNote(context: context);
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: EditNoteViewBody(
        isReadOnly: isReadOnly,
        note: widget.note,
      ),
    );
  }

  _deleteNote({required BuildContext context}) {
    Navigator.pop(context);
    widget.note.delete();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
}
