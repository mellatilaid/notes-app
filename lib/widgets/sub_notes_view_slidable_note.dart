import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/folders_cubits/fetch_folder_subnotes_cubit/fethc_sub_notes_cubit.dart';

import '../helper/slidable_note_enum.dart';
import '../models/note_model.dart';
import 'custom_note_item.dart';

class SubNotesViewSlidableNote extends StatefulWidget {
  const SubNotesViewSlidableNote({
    super.key,
    required this.note,
    required this.index,
  });

  final NoteModel note;
  final int index;

  @override
  State<SubNotesViewSlidableNote> createState() =>
      _SubNotesViewSlidableNoteState();
}

class _SubNotesViewSlidableNoteState extends State<SubNotesViewSlidableNote> {
  late SubNotesCubit notesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesCubit = context.read<SubNotesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () => _onDismissed(),
            ),
            extentRatio: 0.6,
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _onSlidableActionTapped(
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
                onPressed: (context) => _onSlidableActionTapped(
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

  //this fucntion triggred when one of slidable action button
  //tapped (delete, share)
  _onSlidableActionTapped(
      BuildContext context, int index, NoteSlidableAction action) {
    switch (action) {
      case NoteSlidableAction.delete:
        _deleteNote(context);
        break;
      case NoteSlidableAction.share:
        _shareNote();
      default:
    }
  }

  _shareNote() {}

  _deleteNote(BuildContext context) {
    final NoteModel note = widget.note;

    notesCubit.removeFromNotesList(index: widget.index);
    Timer timer = Timer(const Duration(seconds: 2), () {
      notesCubit.removerFromLocalList(index: widget.index);
    });
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey.withOpacity(0.4),
      content: const Text(
        'Note Was deleted',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () async {
          timer.cancel();

          notesCubit.addToNotes(index: widget.index, note: note);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //this function triggred when the note is dissmissed
  _onDismissed() {
    //widget.note.delete();
    //notesCubit.removeFromNotes(index: widget.index);
  }
}
