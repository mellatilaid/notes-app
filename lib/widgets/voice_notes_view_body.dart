import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/widgets/voice_notes_list_view_builder.dart';

class VoiceNotesViewBody extends StatefulWidget {
  const VoiceNotesViewBody({super.key});

  @override
  State<VoiceNotesViewBody> createState() => _VoiceNotesViewBodyState();
}

class _VoiceNotesViewBodyState extends State<VoiceNotesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<VoiceNotesCubit>(context).fetchVoiceNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const VoiceNotesBuilder();
  }
}
