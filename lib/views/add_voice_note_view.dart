import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_voice_note_view_body.dart';

class AddVoiceNoteView extends StatelessWidget {
  const AddVoiceNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Voice'),
      ),
      body: const AddVoiceNoteViewBody(),
    );
  }
}
