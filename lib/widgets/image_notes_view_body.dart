import 'package:flutter/material.dart';

import 'image_notes_list_view.dart';

class ImageNotesViewBody extends StatelessWidget {
  const ImageNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageNotesViewBuilder();
  }
}

class ImageNotesViewBuilder extends StatelessWidget {
  const ImageNotesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImageNotesListView();
  }
}
