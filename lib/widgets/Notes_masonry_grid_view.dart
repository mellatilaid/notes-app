import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_cubit.dart';
import 'package:note_app/cubits/dlelete_note_cubit/delete_note_states.dart';
import 'package:note_app/helper/const.dart';
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
  late Box<NoteModel> notesBox;
  late Box<NoteModel> copyNotes;
  @override
  void initState() {
    super.initState();
    notesBox = Hive.box<NoteModel>(kNoteBox);
    copyNotes = notesBox;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: copyNotes.listenable(),
      builder: (context, Box<dynamic> notes, _) {
        if (notesBox.isEmpty) {
          return const Center(
            child: Text('Add Your Notes'),
          );
        }
        return MasonryGridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 12,
          itemCount: notesBox.length,
          itemBuilder: (context, index) {
            NoteModel note = copyNotes.getAt(index) as NoteModel;

            return BlocBuilder<DeleteNoteCubit, DeleteNoteState>(
              builder: (context, state) {
                return GestureDetector(
                  onLongPress: () {
                    BlocProvider.of<DeleteNoteCubit>(context)
                      ..set(true)
                      ..selectedNoteIndex = index
                      ..noteModel = note;
                    print(notesBox.values);
                  },
                  child: CustomDismissibleNote(
                    notesBox: notesBox,
                    note: note,
                    index: index,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
