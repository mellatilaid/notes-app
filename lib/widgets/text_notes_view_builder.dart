import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/empty_widget.dart';

import '../helper/slidable_enums.dart';
import 'notes_list_view.dart';

class TextNotesViewBuilder extends StatefulWidget {
  const TextNotesViewBuilder({
    super.key,
  });

  @override
  State<TextNotesViewBuilder> createState() => _TextNotesViewBuilderState();
}

class _TextNotesViewBuilderState extends State<TextNotesViewBuilder> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void _onNewNoteAdded(int index, NoteModel note) {
    listKey.currentState?.insertItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesSuccuss) {
          if (state.isAdded != null && state.index != null) {
            _onNewNoteAdded(state.index!, state.notes[state.index!]);
          } else if (state.isDeleted != null && state.index != null) {
            //_onNoteRemoved(state.index!);
          } else {}
        }
      },
      builder: (context, state) {
        if (state is NotesSuccuss) {
          if (state.notes.isEmpty) {
            return const EmptyWidget(
              title: 'Text notes is empty',
              message: 'Add your first text note',
              imagePath: 'assets/note_taking.png',
            );
          }
          return NotesListview(
            widgetLocation: WidgetLocation.textNotesViewBody,
            textNotes: state.notes,
          );
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccuss) {
          if (state.notes.isEmpty) {
            return const EmptyWidget(
              title: 'Text notes is empty',
              message: 'Add your first text note',
              imagePath: 'assets/note_taking.png',
            );
          }
          return NotesListview(
            widgetLocation: WidgetLocation.textNotesViewBody,
            textNotes: state.notes,
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
