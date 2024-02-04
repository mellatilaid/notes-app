import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/models/note_model.dart';

import 'notes_list_view.dart';

class NotesViewBuilder extends StatefulWidget {
  const NotesViewBuilder({
    super.key,
  });

  @override
  State<NotesViewBuilder> createState() => _NotesViewBuilderState();
}

class _NotesViewBuilderState extends State<NotesViewBuilder> {
  late List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccuss) {
          notes = state.notes;

          return NotesListView(
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
