import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/text_notes_cubits_folder/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/text_notes_view_builder.dart';

class TextNotesViewBody extends StatefulWidget {
  const TextNotesViewBody({super.key});

  @override
  State<TextNotesViewBody> createState() => _TextNotesViewBodyState();
}

class _TextNotesViewBodyState extends State<TextNotesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const TextNotesViewBuilder();
  }
}
