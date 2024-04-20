import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/voice_notes_list_view.dart';

import '../cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';
import '../cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import '../cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit_states.dart';
import 'empty_widget.dart';

class VoiceNotesBuilder extends StatelessWidget {
  const VoiceNotesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceNotesCubit, VoiceNotesState>(
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: Text('Add Your Voice Notes'),
          );
        } else if (state is VoiceNotesSuccussState) {
          if (state.voiceNotes.isEmpty) {
            return const EmptyWidget(
              title: 'Audio notes is empty',
              message: 'Add your first audio note',
              imagePath: 'assets/add_audio.png',
            );
          }
          return VoiceNotesListView(
            voiceNotes: state.voiceNotes,
          );
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
  }
}
