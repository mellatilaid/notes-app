import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/helper/slidable_note_enum.dart';

import '../models/note_model.dart';
import 'custom_note_item.dart';

class CustomSlidableNote extends StatefulWidget {
  const CustomSlidableNote({
    super.key,
    required this.note,
    required this.index,
  });

  final NoteModel note;
  final int index;

  @override
  State<CustomSlidableNote> createState() => _CustomSlidableNoteState();
}

class _CustomSlidableNoteState extends State<CustomSlidableNote> {
  late NotesCubit notesCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesCubit = context.read<NotesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        key: ValueKey<int>(widget.index),
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) => _onDimissed(
              context,
              widget.index,
              NoteSlidableAction.delete,
            ),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) => _onDimissed(
              context,
              widget.index,
              NoteSlidableAction.share,
            ),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ]),
        child: CustomNoteItem(note: widget.note),
      ),
    );
  }

  _onDimissed(BuildContext context, int index, NoteSlidableAction action) {
    switch (action) {
      case NoteSlidableAction.delete:
        _deleteNote(context);
        break;
      default:
    }
  }

  _deleteNote(BuildContext context) {
    Timer timer = Timer(const Duration(seconds: 2), () {
      widget.note.delete();
      notesCubit.removeFromNotes(index: widget.index);
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey.withOpacity(0.4),
      content: const Text(
        'Note Will be deleted',
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
  }
}
