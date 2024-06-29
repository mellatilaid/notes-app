import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/helper/local_file_manager.dart';
import 'package:note_app/models/voice_note_model.dart';
import 'package:note_app/widgets/app_bar_icon_button.dart';

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
  final GlobalKey<VoicePlayerViewBodyState> voicePlayerViewBodyStateKey =
      GlobalKey();

  //when save icon cicked
  //then call saveEdit method of voice player view body
  _onEditSaved() {
    if (voicePlayerViewBodyStateKey.currentState != null &&
        voicePlayerViewBodyStateKey.currentState!.mounted) {
      voicePlayerViewBodyStateKey.currentState!.saveEdit();
      setState(() {
        isReadOnly = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: !isReadOnly
            ? AppBarIconButton(
                icon: Icons.done,
                onPressed: () {
                  _onEditSaved();
                },
              )
            : const SizedBox(),
        actions: [
          AppBarIconButton(
            onPressed: () {
              setState(() {
                isReadOnly = !isReadOnly;
              });
            },
            icon: Icons.edit,
          ),
          AppBarIconButton(
            onPressed: () {
              _deleteNote(context: context);
            },
            icon: Icons.delete_outline,
          ),
        ],
      ),
      body: VoicePlayerViewBody(
        key: voicePlayerViewBodyStateKey,
        isReadOnly: isReadOnly,
        voiceNote: widget.voiceNote,
      ),
    );
  }

  _deleteNote({required BuildContext context}) async {
    Navigator.pop(context);
    await LocalFileManager(filePath: widget.voiceNote.voicePath)
        .removeFileFromLocal();
    widget.voiceNote.delete();
    if (!mounted) return;
    BlocProvider.of<VoiceNotesCubit>(context).fetchVoiceNotes();
  }
}
