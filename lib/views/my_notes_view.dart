import 'package:flutter/material.dart';
import 'package:note_app/widgets/my_notes_view_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyNotesViewBody(),
    );
  }
}
