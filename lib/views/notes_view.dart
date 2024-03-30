import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/views/add_notes_view.dart';
import 'package:note_app/views/search_notes_view.dart';
import 'package:note_app/widgets/add_note_options_speed_dial.dart';
import 'package:note_app/widgets/notes_view_body.dart';

import '../widgets/add_voice_note_bottom_sheet.dart';

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
        speedDials: [
          customSpeedDialChild(
              onTap: () => context.toView(const AddNotesView()),
              icon: const Icon(Icons.text_fields),
              label: 'Add Text'),
          customSpeedDialChild(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const AddVoiceNoteBottomSheet();
                  });
            },
            icon: const Icon(Icons.voice_chat),
            label: 'Add Voice',
          ),
          customSpeedDialChild(
            icon: const Icon(Icons.image),
            label: 'Add Image',
          ),
        ],
      ),
    );
  }

  SpeedDialChild customSpeedDialChild(
      {required Icon icon, required String label, VoidCallback? onTap}) {
    return SpeedDialChild(
      child: icon,
      // The background color of the mini FAB
      backgroundColor: Colors.grey.withOpacity(0.6),
      // The foreground color of the mini FAB
      foregroundColor: Colors.white,
      // The label of the mini FAB
      label: label,
      // The action to perform when the mini FAB is tapped
      onTap: onTap,
    );
  }
}
