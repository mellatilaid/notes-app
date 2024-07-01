import 'package:flutter/material.dart';
import 'package:note_app/extensions/push_navigation_extension.dart';
import 'package:note_app/views/voice_player_view.dart';
import 'package:note_app/widgets/custom_rounded_icon.dart';

import '../models/voice_note_model.dart';

class CustomVoiceNoteItem extends StatelessWidget {
  final VoiceNoteModel voiceNote;
  const CustomVoiceNoteItem({super.key, required this.voiceNote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.toView(VoicePlayerView(
        voiceNote: voiceNote,
      )),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                voiceNote.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: 'voice_note_${voiceNote.voicePath}',
                    child: const CustomRoundedIcon(
                      icon: Icons.play_arrow,
                      size: 30,
                    ),
                  ),
                  Text(
                    voiceNote.date!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
