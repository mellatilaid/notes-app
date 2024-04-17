import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/folders_cubits/add_folder_cubit/add_folder_states.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit.dart';
import 'package:note_app/cubits/voice_notes_cubits_folder/voice_notes_cubit/voice_notes_cubit_states.dart';

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
          return ListView.builder(
              itemCount: state.voiceNotes.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.blue,
                );
              });
        } else {
          return const Center(
            child: Text('oops there was a problem'),
          );
        }
      },
    );
  }
}
