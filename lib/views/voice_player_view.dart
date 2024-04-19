import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/models/voice_note_model.dart';

import '../widgets/voice_player_view_body.dart';

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
  bool isReadOnly = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: () {
              _deleteNote(context: context);
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
          !isReadOnly
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.done,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: VoicePlayerViewBody(
        isReadOnly: isReadOnly,
        voiceNote: widget.voiceNote,
      ),
    );
  }

  _deleteNote({required BuildContext context}) {
    Navigator.pop(context);
    widget.voiceNote.delete();
    BlocProvider.of<VoiceNotesCubit>(context).fetchVoiceNotes();
  }
}
