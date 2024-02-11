import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/helper/custom_speed_dial_child.dart';
import 'package:note_app/views/add_notes_view.dart';
import 'package:note_app/views/search_notes_view.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
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
          IconButton(
            onPressed: () {
              context.toView(const SearchNotesView());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: const NotesViewBody(),
      floatingActionButton: AddNoteOptionsSpeedDial(
        dialChilds: [
          customSpeedDialChild(
            icon: const Icon(Icons.text_decrease),
            label: 'Add Text',
            onTap: () {
              context.toView(const AddNotesView());
            },
          ),
          customSpeedDialChild(
              icon: const Icon(Icons.voice_chat), label: 'Add Voice'),
          customSpeedDialChild(
              icon: const Icon(Icons.photo), label: 'Add Photo'),
        ],
      ),
    );
  }
}
