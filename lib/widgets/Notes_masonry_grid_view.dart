import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_cubit.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_states.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_dismissible_note.dart';

class NotesMasonryGridView extends StatefulWidget {
  const NotesMasonryGridView({
    super.key,
  });

  @override
  State<NotesMasonryGridView> createState() => _NotesMasonryGridViewState();
}

class _NotesMasonryGridViewState extends State<NotesMasonryGridView> {
  late List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccuss) {
          notes = state.notes;
          return MasonryGridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 12,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              //NoteModel note = copyNotes.getAt(index) as NoteModel;

              return BlocBuilder<DeleteNoteCubit, DeleteNoteState>(
                builder: (context, state) {
                  return GestureDetector(
                    onLongPress: () {
                      BlocProvider.of<DeleteNoteCubit>(context)
                        ..set(true)
                        ..selectedNoteIndex = index
                        ..noteModel = notes[index];
                    },
                    child: CustomDismissibleNote(
                      notesBox: notes,
                      note: notes[index],
                      index: index,
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
  }
}
