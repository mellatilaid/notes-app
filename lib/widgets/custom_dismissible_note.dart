import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';

import '../cubits/dlelete_note_cubit/delete_note_cubit.dart';
import '../models/note_model.dart';
import 'custom_note_item.dart';

class CustomDismissibleNote extends StatefulWidget {
  const CustomDismissibleNote({
    super.key,
    required this.note,
    required this.index,
    required this.notes,
    required this.itemKey,
  });

  final NoteModel note;
  final int index;
  final List<NoteModel> notes;
  final Key itemKey;

  @override
  State<CustomDismissibleNote> createState() => _CustomDismissibleNoteState();
}

class _CustomDismissibleNoteState extends State<CustomDismissibleNote> {
  late NotesCubit notesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesCubit = context.read<NotesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Dismissible(
        key: widget.itemKey,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          child: const Center(
            child: Icon(
              Icons.delete,
            ),
          ),
        ),
        confirmDismiss: (direction) async {
          _deleteNote(context: context, index: widget.index);
          return null;
        },
        child: CustomNoteItem(
          isNoteSelected:
              BlocProvider.of<DeleteNoteCubit>(context).selectedNoteIndex ==
                  widget.index,
          note: widget.note,
        ),
      ),
    );
  }

  _deleteNote({required BuildContext context, required int index}) async {
    Timer timer = Timer(const Duration(seconds: 2), () {
      widget.note.delete();
      notesCubit.removeFromNotes(index: index);
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      content: const Text(
        'Note deleted',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () async {
          timer.cancel();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return true;
  }
}
