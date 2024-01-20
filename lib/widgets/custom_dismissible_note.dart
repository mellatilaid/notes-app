import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/dlelete_note_cubit/delete_note_cubit.dart';
import '../models/note_model.dart';
import 'custom_note_item.dart';

class CustomDismissibleNote extends StatelessWidget {
  const CustomDismissibleNote({
    super.key,
    required this.note,
    required this.index,
  });

  final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.title),
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
        note.delete();
      },
      child: CustomNoteItem(
        isNoteSelected:
            BlocProvider.of<DeleteNoteCubit>(context).selectedNoteIndex ==
                index,
        note: note,
      ),
    );
  }
}
