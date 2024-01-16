import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesMasonryGridView extends StatelessWidget {
  const NotesMasonryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomNoteItem();
      },
    );
  }
}
