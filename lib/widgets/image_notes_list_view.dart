import 'package:flutter/material.dart';
import 'package:note_app/widgets/image_note_item.dart';

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
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: imageNotes.length,
      itemBuilder: (context, index) {
        return ImageNoteItem(
          imageNote: imageNotes[index],
        );
      },
    );
  }
}
