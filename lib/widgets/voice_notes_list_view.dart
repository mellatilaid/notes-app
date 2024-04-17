import 'package:flutter/material.dart';

import '../models/voice_note_model.dart';

class VoiceNotesListView extends StatelessWidget {
  final List<VoiceNoteModel> voiceNotes;
  const VoiceNotesListView({super.key, required this.voiceNotes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: voiceNotes.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
        );
      },
    );
  }
}
