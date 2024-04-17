import 'package:flutter/material.dart';
import 'package:note_app/helper/slidable_note_enums.dart';
import 'package:note_app/widgets/notes_view_slidable_note.dart';

import '../models/voice_note_model.dart';

class VoiceNotesListView extends StatelessWidget {
  final List<VoiceNoteModel> voiceNotes;
  const VoiceNotesListView({super.key, required this.voiceNotes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8),
      itemCount: voiceNotes.length,
      itemBuilder: (context, index) {
        return NotesViewSlidableNote(
          noteModel: voiceNotes[index],
          index: index,
          widgetLocation: WidgetLocation.voiceNotesViewBody,
        );
      },
    );
  }
}
