import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/helper/const.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('My Notes'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(),
      body: const NotesViewBody(),
      floatingActionButton: const AddNoteSpeedDial(),
    );
  }
}

class AddNoteSpeedDial extends StatelessWidget {
  const AddNoteSpeedDial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.text_fields),
          // The background color of the mini FAB
          backgroundColor: Colors.green,
          // The foreground color of the mini FAB
          foregroundColor: Colors.white,
          // The label of the mini FAB
          label: 'Add text',
          // The action to perform when the mini FAB is tapped
          onTap: () {
            // Add your logic for adding text here
          },
        ),
      ],
    );
  }
}
