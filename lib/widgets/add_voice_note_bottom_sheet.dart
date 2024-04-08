import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/add_voice_note_cubit/add_voice_note_cubit.dart';
import 'package:note_app/widgets/add_voice_note_bottom_sheet_body.dart';

class AddVoiceNoteBottomSheet extends StatelessWidget {
  const AddVoiceNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddVoiceNoteCubit(),
      child: const AddVoiceNoteBottomSheetBody(),
    );
  }
}
