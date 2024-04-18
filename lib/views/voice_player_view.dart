import 'package:flutter/material.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class VoicePlayerView extends StatefulWidget {
  final VoiceNoteModel voiceNote;
  const VoicePlayerView({
    super.key,
    required this.voiceNote,
  });

  @override
  State<VoicePlayerView> createState() => _VoicePlayerViewState();
}

class _VoicePlayerViewState extends State<VoicePlayerView> {
  late TextEditingController _titleController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.voiceNote.title);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('voice palyer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _titleController,
              hintText: 'Title',
            ),
          ],
        ),
      ),
    );
  }
}
