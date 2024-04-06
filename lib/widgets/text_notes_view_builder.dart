import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubits_folder/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/helper/slidable_note_enum.dart';
import 'package:note_app/models/note_model.dart';

import 'text_notes_list_view.dart';

class TextNotesViewBuilder extends StatefulWidget {
  const TextNotesViewBuilder({
    super.key,
  });

  @override
  State<TextNotesViewBuilder> createState() => _TextNotesViewBuilderState();
}

class _TextNotesViewBuilderState extends State<TextNotesViewBuilder> {
  late List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccuss) {
          notes = state.notes;

          return TextNotesListview(
            notesCubitSource: NotesCubitSource.notesCubit,
            notes: notes,
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

/*class NotesGridView extends StatelessWidget {
  final List<NoteModel> notes;
  const NotesGridView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 12,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        //NoteModel note = copyNotes.getAt(index) as NoteModel;

        return CustomDismissibleNote(
          itemKey: ValueKey<int>(index),
          notes: notes,
          note: notes[index],
          index: index,
        );
      },
    );
  }
}*/
