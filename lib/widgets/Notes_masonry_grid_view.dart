import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesMasonryGridView extends StatefulWidget {
  const NotesMasonryGridView({
    super.key,
  });

  @override
  State<NotesMasonryGridView> createState() => _NotesMasonryGridViewState();
}

class _NotesMasonryGridViewState extends State<NotesMasonryGridView> {
  late Box<NoteModel> notesBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesBox = Hive.box<NoteModel>(kNoteBox);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notesBox.listenable(),
      builder: (context, Box<dynamic> notes, _) {
        if (notesBox.isEmpty) {
          return const Center(
            child: Text('Add Your Notes'),
          );
        }
        return MasonryGridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
          itemCount: notesBox.length,
          itemBuilder: (context, index) {
            NoteModel note = notesBox.getAt(index) as NoteModel;
            return CustomNoteItem(
              note: note,
            );
          },
        );
      },
    );
  }
}
