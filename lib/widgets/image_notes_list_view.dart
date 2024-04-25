import 'package:flutter/material.dart';
import 'package:note_app/widgets/image_note_item.dart';

class ImageNotesListView extends StatelessWidget {
  const ImageNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ImageNoteItem(
          leading: Image.asset('assets/messi.jpg'),
          title: 'mellati laid',
          trailing: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
