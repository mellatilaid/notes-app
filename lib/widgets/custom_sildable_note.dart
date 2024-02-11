import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/search_note_cubit/search_note_cubit.dart';
import 'package:note_app/helper/slidable_note_enum.dart';

import '../models/note_model.dart';
import 'custom_note_item.dart';

class CustomSlidableNote extends StatefulWidget {
  final NotesCubitSource notesCubitSource;
  const CustomSlidableNote({
    super.key,
    required this.note,
    required this.index,
    required this.notesCubitSource,
  });

  final NoteModel note;
  final int index;

  @override
  State<CustomSlidableNote> createState() => _CustomSlidableNoteState();
}

class _CustomSlidableNoteState extends State<CustomSlidableNote> {
  late NotesCubit notesCubit;
  late SearchNoteCubit searchNoteCubit;
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
      default:
    }
  }

  _deleteNote(BuildContext context) {
    final NoteModel note = widget.note;

    switch (widget.notesCubitSource) {
      case NotesCubitSource.notesCubit:
        notesCubit.removeFromNotes(index: widget.index);
        break;
      case NotesCubitSource.searchCubit:
        searchNoteCubit = context.read<SearchNoteCubit>();
        searchNoteCubit.removeFromNotes(index: widget.index);
        notesCubit.removeFromNotes(index: widget.index);
      default:
    }
    Timer timer = Timer(const Duration(seconds: 2), () {
      widget.note.delete();
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

          switch (widget.notesCubitSource) {
            case NotesCubitSource.notesCubit:
              notesCubit.addToNotes(index: widget.index, note: note);
              break;
            case NotesCubitSource.searchCubit:
              searchNoteCubit.addToNotes(index: widget.index, note: note);
              notesCubit.addToNotes(index: widget.index, note: note);
              break;
            default:
          }
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //this function triggred when the note is dissmissed
  _onDismissed() {
    widget.note.delete();
    notesCubit.removeFromNotes(index: widget.index);
  }
}
