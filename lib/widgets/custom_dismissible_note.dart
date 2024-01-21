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
    required this.notesBox,
  });

  final NoteModel note;
  final int index;
  final List<NoteModel> notesBox;

  @override
  State<CustomDismissibleNote> createState() => _CustomDismissibleNoteState();
}

class _CustomDismissibleNoteState extends State<CustomDismissibleNote> {
  bool isUndoPressed = false;
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Dismissible(
        key: Key(widget.note.title),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.delete,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          deleteNote(context: context, index: widget.index);
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

  deleteNote({required BuildContext context, required int index}) async {
    BlocProvider.of<NotesCubit>(context).removeFromNotes(index: index);
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
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
          isUndoPressed = true;
          isDeleting = false;
        },
      ),
    );
    Timer(const Duration(seconds: 5), () {
      if (isUndoPressed) {
        isUndoPressed = false;
        isDeleting = false;
      } else {
        widget.note.delete();
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
