import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_form.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: AddNoteForm(),
    );
  }
}
