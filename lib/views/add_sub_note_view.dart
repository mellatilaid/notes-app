import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_sub_note_view_body.dart';

class AddSubNoteView extends StatelessWidget {
  const AddSubNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Note'),
      ),
      body: const AddSubNoteViewBody(),
    );
  }
}
