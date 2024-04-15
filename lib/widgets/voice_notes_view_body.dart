import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';

class VoiceNotesViewBody extends StatelessWidget {
  const VoiceNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceNotesCubit(),
      child: Container(),
    );
  }
}

class VoiceNotesBuilder extends StatelessWidget {
  const VoiceNotesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
