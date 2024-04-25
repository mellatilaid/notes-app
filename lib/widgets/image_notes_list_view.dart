import 'package:flutter/material.dart';

import 'image_notes_view_body.dart';

class ImageNotesListView extends StatelessWidget {
  const ImageNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomListTile(
          leading: Image.asset('assets/messi.jpg'),
          title: 'mellati laid',
          trailing: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
