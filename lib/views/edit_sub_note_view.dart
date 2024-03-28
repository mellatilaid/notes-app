import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_note_cubit.dart';
import 'package:note_app/cubits/folders_cubits/edit_sub_notes_cubit/edit_sub_notes_states.dart';
import 'package:note_app/widgets/edit_sub_note_view_body.dart';

import '../models/note_model.dart';

class EditSubNoteView extends StatelessWidget {
  final NoteModel note;
  const EditSubNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditSubNoteCubit, EditSubNotesState>(
      listener: (context, state) {
        if (state is SuccussState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Edit Note'),
        ),
        body: EditSubNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
