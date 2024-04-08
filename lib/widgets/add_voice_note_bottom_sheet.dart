import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/add_voice_note_cubit/add_vioce_note_cubit_states.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/add_voice_note_cubit/add_voice_note_cubit.dart';
import 'package:note_app/widgets/add_voice_note_bottom_sheet_body.dart';

class AddVoiceNoteBottomSheet extends StatelessWidget {
  final TabController voiceTabController;
  const AddVoiceNoteBottomSheet({super.key, required this.voiceTabController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddVoiceNoteCubit(),
      child: BlocListener<AddVoiceNoteCubit, AddVoiceNotesState>(
        listener: (context, state) {
          if (state is AddVoiceNoteSuccuss) {
            Navigator.pop(context);
            //Navigating the user to voice notes tab
            //when the voice is added sucussfly
            voiceTabController.animateTo(1);
          }
        },
        child: const AddVoiceNoteBottomSheetBody(),
      ),
    );
  }
}
