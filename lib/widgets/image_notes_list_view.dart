import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_enums.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';

import '../models/image_note_model.dart';

class ImageNotesListView extends StatelessWidget {
  final List<ImageNoteModel> imageNotes;
  const ImageNotesListView({
    super.key,
    required this.imageNotes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: imageNotes.length,
      itemBuilder: (context, index) {
        return NotesViewSlidableNote(
          noteModel: imageNotes[index],
          index: index,
          widgetLocation: WidgetLocation.imageNotesViewBody,
        );
      },
    );
  }
}
